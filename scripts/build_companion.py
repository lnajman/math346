"""Render the approved student source project and copy only its release allowlist."""
from pathlib import Path
from html.parser import HTMLParser
from urllib.parse import urlparse,unquote
import hashlib,json,os,re,shutil,subprocess
ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'companion-source'
OUT=SOURCE/'_rendered'
PUBLIC=ROOT/'companion'
manifest=json.loads((SOURCE/'release.json').read_text())
env=dict(os.environ,LANG='en_US.UTF-8',LC_ALL='en_US.UTF-8')
for name,digest in manifest['resources'].items():
    assert hashlib.sha256((SOURCE/name).read_bytes()).hexdigest()==digest,name
subprocess.run(['quarto','render',str(SOURCE)],cwd=ROOT,env=env,check=True)
files={f'{page}.html':OUT/f'{page}.html' for page in manifest['pages']}
files['index.html']=OUT/'chapters.html'
files.update({name:OUT/name for name in manifest['resources']})
class Page(HTMLParser):
    def __init__(self):
        super().__init__();self.ids=set();self.links=[];self.assets=[];self.text=[];self.skip=0
    def handle_starttag(self,tag,attrs):
        a=dict(attrs)
        if 'id' in a:self.ids.add(a['id'])
        if tag=='a' and 'href' in a:self.links.append(a['href'])
        if tag in ['script','img','iframe'] and 'src' in a:self.assets.append(a['src'])
        if tag=='link' and 'href' in a:self.assets.append(a['href'])
        assert tag!='form','Unexpected student response form'
        if tag=='details':assert 'open' not in a
        if tag in ['script','style']:self.skip+=1
    def handle_endtag(self,tag):
        if tag in ['script','style']:self.skip-=1
    def handle_data(self,text):
        if not self.skip:self.text.append(text)
pages={}
for name,path in files.items():
    assert path.is_file(),name
    if name.endswith('.html'):
        page=Page();page.feed(path.read_text());pages[name]=page
        text='\n'.join(page.text)
        for marker in ['Draft for instructor review','Review questions: Can a solo reader','CHANGES.md','VALIDATION.txt','TIMING-CHECKLIST','instructor-private/','/Users/','@ku.ac.ae','raw feedback','exit-ticket feedback','Instructor key:','Private key:']:
            assert marker not in text,(name,marker)
        assert all(asset.startswith('data:') for asset in page.assets),(name,'nonembedded asset')
        assert not re.search(r'(?<![.\d])\b\d{8,10}\b(?![.\d])',text),(name,'possible personal identifier')
for name,page in pages.items():
    for href in page.links:
        u=urlparse(href)
        if not u.scheme:
            target=unquote(u.path) or name
            assert target in files,(name,href)
            if u.fragment:assert target in pages and unquote(u.fragment) in pages[target].ids,(name,href)
        else:
            assert u.scheme=='https' and u.netloc=='lnajman.github.io' and u.path.startswith('/math346/'),(name,href)
            target=ROOT/unquote(u.path.removeprefix('/math346/'))
            assert target.is_file() or target.with_suffix('.qmd').is_file(),href
for name,digest in manifest['resources'].items():
    assert hashlib.sha256(files[name].read_bytes()).hexdigest()==digest,name
# Refuse to delete or silently retain an unexpected file from a previous release.
existing={str(p.relative_to(PUBLIC)) for p in PUBLIC.rglob('*') if p.is_file()}
assert existing<=set(files),existing-set(files)
for name,path in files.items():
    target=PUBLIC/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(path,target)
assert {str(p.relative_to(PUBLIC)) for p in PUBLIC.rglob('*') if p.is_file()}==set(files)
inspection=json.loads(subprocess.check_output(['quarto','inspect'],cwd=ROOT,env=env))
for key in ['input','resources']:
    assert not any('companion-review/' in path or 'companion-source/' in path for path in inspection['files'].get(key,[]))
print(f'PASS: published bundle prepared: {len(pages)} student HTML pages, {len(manifest["resources"])} public resources')
print('PASS: navigation, embedded assets, closed reveals, public-file hashes and source exclusion')
