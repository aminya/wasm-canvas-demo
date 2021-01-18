extern(C): // disable D mangling

immutable uint WIDTH = 600;
immutable uint HEIGHT = 600;
uint[WIDTH * HEIGHT] BUFFER;

void draw() @safe @nogc {
    for (int x = 0; x < WIDTH; x++) {
        for (int y = 0; y < HEIGHT; y++) {

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
