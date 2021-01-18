extern "C" {

const auto WIDTH = 600u;
const auto HEIGHT = 600u;
unsigned int BUFFER[WIDTH * HEIGHT];

void draw() {
    for (auto x = 0u; x < WIDTH; x++) {
        for (auto y = 0u; y < HEIGHT; y++) {

            unsigned int color;
            if (y < HEIGHT/2) {
                color = 0xff0000ff; // RGBA little endian
            } else {
                color = 0xffff0000; // RGBA little endian
            }

            BUFFER[WIDTH * x + y] = color;
        }
    }
}



} // extern C needed for exporting to wasm
