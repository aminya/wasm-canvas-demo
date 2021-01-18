immutable auto WIDTH = 600u;
immutable auto HEIGHT = 600u;

extern(C): // disable D mangling for wasm exports

uint[WIDTH * HEIGHT] ImageDataBuffer;

void draw() @safe @nogc {
    foreach (x; 0..WIDTH) {
        foreach (y; 0..HEIGHT) {

            // RHS: RGBA little endian color
            ImageDataBuffer[WIDTH * x + y] =  y < HEIGHT/2 ? 0xff0000ff : 0xffff0000;
        }
    }
}

void _start() {}
