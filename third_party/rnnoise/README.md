# RNNoise browser build

Pinned from https://github.com/jitsi/rnnoise-wasm/tree/cb529a59a8478fe604e57986fc96afdaecfa6fb7
RNNoise source: https://github.com/xiph/rnnoise/tree/372f7b4b76cde4ca1ec4605353dd17898a99de38

`rnnoise-sync.js` is the unmodified upstream synchronous WebAssembly distribution.
SHA-256: `05a553f523d59502d133a6d05dbf1878137c9e7bcff06edf5561f7001b62f95f`

The Jitsi wrapper is Apache-2.0; RNNoise is BSD-3-Clause. Both licenses are included.
Run `python3 tools/embed_call_denoise.py` after changing the local worklet. The script
embeds the pinned build, licenses, and worklet into the frontend so calls need no CDN
or extra server route. The existing frontend build stamp covers the embedded bytes.
