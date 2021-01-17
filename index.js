async function main() {
  const { instance } = await WebAssembly.instantiateStreaming(
    fetch("./dist/graphics.wasm"), {}
  );
  const width = 600;
  const height = 600;

  // WASM implementation
  const [canvas, ctx] = get_canvas("demo-canvas")
  canvas.width = width;
  canvas.height = height;

  const image = init_draw_wasm(instance, width, height)
  draw_wasm(instance, ctx, image)

  // JS implementation using fillRect
  const [canvas2, ctx2] = get_canvas("demo-canvas-2")
  canvas2.width = width;
  canvas2.height = height;

  draw_js(ctx2, width, height)
}

function get_canvas(id) {
  const canvas = document.getElementById(id);
  const ctx = canvas.getContext("2d");
  return [canvas, ctx]
}


// called only once
// ImageData is a live view to the underlying Uint8ClampedArray,
// and Uint8ClampedArray is a live view to the underlying ArrayBuffer,
// which is exported by the wasm as a memory instance.
function init_draw_wasm(instance, width, height) {
  const buffer_address = instance.exports.BUFFER.value; // here
  const image = new ImageData(
      new Uint8ClampedArray(
          instance.exports.memory.buffer, //here
          buffer_address,
          4 * width * height,
      ),
      width,
  );
  return image
}

// can be called for each frame
// the wasm changes the memory and then canvas needs to be updated
function draw_wasm(instance, ctx, image) {
  instance.exports.draw(); // here
  ctx.putImageData(image, 0, 0);
}

function draw_js(ctx2, width, height) {
  ctx2.fillStyle = 'blue'
  ctx2.fillRect(0, 0, width/2, height)

  ctx2.fillStyle = 'red'
  ctx2.fillRect(width/2, 0, width/2, height)
}

main().catch((err) => {throw err})
