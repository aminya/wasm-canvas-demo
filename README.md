# WASM Canvas DEMO

![canvas-demo](images/canvas-demo.png)

## Install
You need to have `npm`. Then:
```
npm install
```

### Build
```
npm run build
```

There are different build scripts.
```
npm run build.clang           # requires clang           https://releases.llvm.org/download.html
npm run build.emsdk           # requires emsdk           https://emscripten.org/docs/getting_started/downloads.html
npm run build.d               # requires ldc             https://github.com/ldc-developers/ldc/releases
npm run build.decompile       # requires wabt            https://github.com/WebAssembly/wabt/releases
npm run build.wasm2wat        # requires wabt            https://github.com/WebAssembly/wabt/releases
npm run build.wasm2js         # requires binaryan        https://github.com/WebAssembly/binaryen/releases
npm run build.asmjs           # requires emsdk           https://emscripten.org/docs/getting_started/downloads.html
```

To clean
```
npm run clean
```

### Run
After you built:
```
npm run serve
```
