extern(C): // disable D mangling

immutable uint WIDTH = 600;
immutable uint HEIGHT = 600;
uint[WIDTH * HEIGHT] BUFFER;

void draw() @safe @nogc {
    uint[600][600] screen;
    int x;
    for (x = 0; x < WIDTH; x++) {
        int y;
        for (y = 0; y < HEIGHT; y++) {
            uint color;
            if (y < HEIGHT/2) {
                color = 0xff0000ff; // RGBA little endian
            } else {
                color = 0xffff0000; // RGBA little endian
            }

            screen[x][y] = color;
            BUFFER[WIDTH * x + y] = screen[x][y];
        }
    }
}

void _start() {}
