#!/usr/bin/env python3
"""Embed the pinned, local RNNoise worklet and licenses in the measured app shell."""
from pathlib import Path
import hashlib

ROOT = Path(__file__).resolve().parents[1]
VENDOR = ROOT / 'third_party/rnnoise'
HTML = ROOT / 'lib/noltbook/index.html'
START = '<!-- BEGIN LOCAL CALL DENOISER -->'
END = '<!-- END LOCAL CALL DENOISER -->'


def main():
    upstream = (VENDOR / 'rnnoise-sync.js').read_text()
    licenses = '\n\n'.join((VENDOR / name).read_text() for name in
                           ['Jitsi-LICENSE.txt', 'RNNoise-LICENSE.txt'])
    own = (ROOT / 'lib/noltbook/audio/denoise-worklet.js').read_text()
    assert '</script' not in (upstream + licenses + own).lower()
    assert '*/' not in licenses
    source = '/* Bundled RNNoise: see third_party/rnnoise/README.md.\n' + licenses + '\n*/\n' + upstream + '\n' + own
    # Whitespace-only normalization of the embedded copy; vendored bytes stay exact.
    source = '\n'.join(line.rstrip() for line in source.split('\n'))
    block = START + '\n<script id="callDenoiseWorklet" type="text/plain">\n' + source + '\n</script>\n' + END
    html = HTML.read_text()
    if START in html:
        a = html.index(START)
        b = html.index(END, a) + len(END)
        html = html[:a] + block + html[b:]
    else:
        html = html.replace('</body>', block + '\n</body>')
    HTML.write_text(html)
    print('Embedded local worklet SHA-256:', hashlib.sha256(source.encode()).hexdigest())


if __name__ == '__main__':
    main()
