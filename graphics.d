extern(C): // disable D mangling

immutable auto WIDTH = 600u;
immutable auto HEIGHT = 600u;
uint[WIDTH * HEIGHT] BUFFER;

void draw() @safe @nogc {
    for (auto x = 0u; x < WIDTH; x++) {
        for (auto y = 0u; y < HEIGHT; y++) {

            uint color;
            if (y < HEIGHT/2) {
                color = 0xff0000ff; // RGBA little endian
            } else {
                color = 0xffff0000; // RGBA little endian
            }

            BUFFER[WIDTH * x + y] = color;
        }
    }
}

void _start() {}
