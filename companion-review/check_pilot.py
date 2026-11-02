"""Check the rendered pilot, public-file allowlist and student-visible R code."""
from pathlib import Path
from html.parser import HTMLParser
from urllib.parse import urlparse, unquote
import json
import os
import re
import shutil
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
OUT = HERE / '_preview'
PAIRS = {
    'week10-service-events.csv': 'data/week10-service-events.csv',
    'week11-readable-pipeline.R': 'code/r/week11-readable-pipeline.R',
    'week11-function-contracts.R': 'code/r/week11-function-contracts.R',
    'week11-ai-refactor-review.R': 'code/r/week11-ai-refactor-review.R',
    'solutions/week11-readable-pipeline_sol.R': 'code/r/solutions/week11-readable-pipeline_sol.R',
    'solutions/week11-function-contracts_sol.R': 'code/r/solutions/week11-function-contracts_sol.R',
}
for directory in (HERE / 'downloads', OUT / 'downloads'):
    actual = {str(p.relative_to(directory)) for p in directory.rglob('*') if p.is_file()}
    assert actual == set(PAIRS), (directory, actual)
    for destination, original in PAIRS.items():
        assert (directory / destination).read_bytes() == (ROOT / original).read_bytes()
print('PASS: all six source and rendered downloads match their public originals')

class Page(HTMLParser):
    def __init__(self):
        super().__init__()
        self.ids, self.links, self.assets, self.text = set(), [], [], []
        self.forms = self.details = 0
        self.detail_texts, self.active_details = [], []
        self.skip = 0
    def handle_starttag(self, tag, attrs):
        a = dict(attrs)
        if 'id' in a:
            self.ids.add(a['id'])
        if tag == 'a' and 'href' in a:
            self.links.append(a['href'])
        if tag in ('script', 'img', 'iframe') and 'src' in a:
            self.assets.append(a['src'])
        if tag == 'link' and 'href' in a:
            self.assets.append(a['href'])
        self.forms += tag == 'form'
        self.details += tag == 'details'
        if tag == 'details':
            assert 'open' not in a, 'Reference reveals must start collapsed'
            self.detail_texts.append([])
            self.active_details.append(len(self.detail_texts) - 1)
        if tag in ('script', 'style'):
            self.skip += 1
    def handle_endtag(self, tag):
        if tag == 'details':
            self.active_details.pop()
        if tag in ('script', 'style'):
            self.skip -= 1
    def handle_data(self, data):
        if not self.skip:
            self.text.append(data)
            for index in self.active_details:
                self.detail_texts[index].append(data)

html = (OUT / 'week-11.html').read_text()
page = Page()
page.feed(html)
assert page.forms == 0 and page.details == 16
for function in ('within_target', 'summarize_issue'):
    assert any('Reference implementation' in ''.join(parts) and
               re.search(rf'{function}\s*<-\s*function', ''.join(parts))
               for parts in page.detail_texts), f'{function} must remain inside a closed reveal'
assert sum('self-check' in ''.join(parts).lower() for parts in page.detail_texts) >= 2
print('PASS: both full implementations and both solo model answers are in collapsed reveals')
for href in page.links:
    u = urlparse(href)
    if href.startswith('#'):
        assert unquote(u.fragment) in page.ids, href
    elif not u.scheme:
        assert (OUT / unquote(u.path)).is_file(), href
    else:
        assert href.startswith('https://lnajman.github.io/math346/'), href
        path = u.path.removeprefix('/math346/')
        assert (ROOT / Path(path).with_suffix('.qmd')).is_file(), href
for asset in page.assets:
    assert asset.startswith('data:'), asset
text = '\n'.join(page.text)
for forbidden in ('/Users/', 'instructor-private/', '@ku.ac.ae',
                  'Private key:', 'Instructor key:', 'download-2',
                  'author-render-path', 'knitr::', 'Instructor review draft',
                  'exit-ticket feedback', 'instructor synthesis', 'instructor scripts'):
    assert forbidden not in html if forbidden in ('/Users/', 'instructor-private/') else forbidden not in text, forbidden
assert not re.search(r'\b\d{8,10}\b', text), 'Possible personal identifier'
print('PASS: anchors, download links and course-source targets; 16 disclosures; no forms or remote assets')
print('PASS: privacy checks (allowlist plus known private markers; editorial review still required)')

env = dict(os.environ, LANG='en_US.UTF-8', LC_ALL='en_US.UTF-8')
inspection = json.loads(subprocess.check_output(['quarto', 'inspect'], cwd=ROOT, env=env))
assert not any('companion-review/' in p for p in inspection['files']['input'])
print('PASS: public render inputs exclude the pilot')

source = (HERE / 'week-11.qmd').read_text()
chunks = []
for block in re.findall(r'^```\{r\}\n(.*?)^```', source, re.M | re.S):
    if '#| include: false' in block or '#| echo: false' in block:
        continue
    label = re.search(r'^#\| label: (.+)$', block, re.M).group(1)
    code = '\n'.join(line for line in block.splitlines() if not line.startswith('#|'))
    assert 'knitr::' not in code, 'Author formatting leaked into student code'
    chunks.append((label, code))
with tempfile.TemporaryDirectory(prefix='math346-companion-') as tmp:
    work = Path(tmp)
    (work / 'data').mkdir()
    shutil.copyfile(ROOT / 'data/week10-service-events.csv', work / 'data/week10-service-events.csv')
    for starter in ('week11-readable-pipeline.R', 'week11-function-contracts.R'):
        shutil.copyfile(HERE / 'downloads' / starter, work / starter)
    routes = {
        'complete-chapter': chunks,
        'meeting-two-independent': [(label, code) for label, code in chunks
            if label in ('setup-files', 'setup-check', 'import', 'read-events', 'failed-check-demo') or label in (
                'within-target', 'vector-tests', 'invalid-vector-tests', 'meeting-two-data',
                'summarize-function', 'summary-tests', 'summary-edge-tests',
                'flawed-threshold', 'ai-threshold-evidence', 'flawed-summary', 'ai-summary-evidence',
                'transfer-variant', 'transfer-evidence')],
    }
    for name, blocks in routes.items():
        script = work / (name + '.R')
        script.write_text('\n\n'.join(code for _, code in blocks))
        result = subprocess.run(['Rscript', '--vanilla', str(script)], cwd=work,
                                env=env, capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
        assert 'Setup OK' in result.stdout
        assert 'Error: nrow(events_raw) == 8 is not TRUE' in result.stdout
        print(f'PASS: {name}, {len(blocks)} student-visible R blocks in a fresh session')
# Check the setup diagnostic in an empty folder as well as the successful route.
with tempfile.TemporaryDirectory(prefix='math346-missing-') as tmp:
    setup = '\n'.join(code for label, code in chunks if label in ('setup-files', 'setup-check'))
    result = subprocess.run(['Rscript', '--vanilla', '-e', setup], cwd=tmp,
                            env=env, capture_output=True, text=True)
    assert result.returncode == 0 and 'Missing from the current folder:' in result.stdout
    assert 'Setup OK' not in result.stdout
    assert all(path in result.stdout for path in (
        'week11-readable-pipeline.R', 'week11-function-contracts.R', 'data/week10-service-events.csv'))
print('PASS: missing-file setup diagnostic lists all three missing paths')
print('Pilot validation complete.')
