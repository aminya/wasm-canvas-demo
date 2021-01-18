extern "C" {

const auto WIDTH = 600u;
const auto HEIGHT = 600u;
unsigned int BUFFER[WIDTH * HEIGHT];

void draw() {
    for (auto x = 0u; x < WIDTH; x++) {
        for (auto y = 0u; y < HEIGHT; y++) {

            // RHS: RGBA little endian color
            BUFFER[WIDTH * x + y] =  y < HEIGHT/2 ? 0xff0000ff : 0xffff0000;

        }
    }
}



} // extern C needed for exporting to wasm
