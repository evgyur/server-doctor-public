#!/usr/bin/env python3
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]

PRIVATE_HINTS = [
    r'\bintel64\b', r'\bryzen64\b', r'\bmac-mini-claw\b', r'\bscrum-dashboard\b',
    r'\bChipCR\b', r'~/', r'/home/', r'127\.0\.0\.1', r'\.openclaw',
    r'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b',
    r'\b\d{1,3}(?:\.\d{1,3}){3}\b'
]
DOCTRINE_HINTS = [
    r'\bevidence\b', r'\boutage\b', r'\brecovery\b', r'\baudit\b', r'\brouting\b', r'\bdoctrine\b'
]


def classify(path: pathlib.Path, text: str) -> str:
    rel = path.relative_to(ROOT).as_posix()
    if rel.startswith('incidents/'):
        return 'incident'
    if rel.startswith('references/core/'):
        return 'core'
    if rel.startswith('references/overlays/'):
        return 'overlay'
    if any(re.search(p, text, re.I) for p in PRIVATE_HINTS):
        return 'overlay-candidate'
    if any(re.search(p, text, re.I) for p in DOCTRINE_HINTS):
        return 'core-candidate'
    return 'unclassified'


def review(paths: list[str]) -> int:
    bad = 0
    for raw in paths:
        path = pathlib.Path(raw)
        if not path.is_absolute():
            path = ROOT / raw
        if not path.exists() or not path.is_file():
            print(f'SKIP {raw}: not a file')
            continue
        text = path.read_text(errors='ignore')[:12000]
        cls = classify(path, text)
        rel = path.relative_to(ROOT).as_posix()
        print(f'{rel}: {cls}')
        if rel.startswith('references/core/') and cls == 'overlay-candidate':
            print('  WARN: looks too environment-specific for core doctrine')
            bad += 1
        if rel.startswith('references/overlays/') and cls == 'core-candidate' and cls != 'overlay-candidate':
            print('  WARN: may belong in doctrine instead of overlay')
            bad += 1
    return 1 if bad else 0


def main() -> int:
    args = sys.argv[1:]
    if not args:
        args = ['SKILL.md', 'references', 'incidents']
    expanded: list[str] = []
    for arg in args:
        p = pathlib.Path(arg)
        if not p.is_absolute():
            p = ROOT / arg
        if p.is_dir():
            for child in sorted(p.rglob('*.md')):
                expanded.append(str(child))
        else:
            expanded.append(str(p))
    return review(expanded)


if __name__ == '__main__':
    raise SystemExit(main())
