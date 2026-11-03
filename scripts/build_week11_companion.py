"""Compatibility entry point: rebuild the complete approved companion release.

Week 11 now belongs to the Weeks 1–12 companion. Its historical pilot source
remains under companion-review/ for reference; use the current release builder.
"""
from pathlib import Path
import subprocess,sys
subprocess.run([sys.executable,str(Path(__file__).with_name('build_companion.py'))],check=True)
