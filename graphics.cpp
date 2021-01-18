extern "C" {

const unsigned int WIDTH = 600;
const unsigned int HEIGHT = 600;
unsigned int BUFFER[WIDTH * HEIGHT];

void draw() {
    unsigned int screen[600][600];
    for (int x = 0; x < WIDTH; x++) {
        for (int y = 0; y < HEIGHT; y++) {

            unsigned int color;
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



} // extern C needed for exporting to wasm
