extern(C): // disable D mangling

immutable auto WIDTH = 600u;
immutable auto HEIGHT = 600u;
uint[WIDTH * HEIGHT] BUFFER;

void draw() @safe @nogc {
    for (auto x = 0u; x < WIDTH; x++) {
        for (auto y = 0u; y < HEIGHT; y++) {

            // RHS: RGBA little endian color
            BUFFER[WIDTH * x + y] =  y < HEIGHT/2 ? 0xff0000ff : 0xffff0000;
        }
    }
}

void _start() {}
