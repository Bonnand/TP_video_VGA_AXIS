#include "ap_axi_sdata.h"
#include "hls_stream.h"

#define DWIDTH 8
typedef ap_int<DWIDTH> type;
typedef hls::axis<type, 0, 0, 0> pkt;

const int FONT_HEIGHT = 5;
const int FONT_WIDTH = 3;

// Describe Two symbol on 3x5 pixels
const type two[FONT_HEIGHT] = {
    0b111,
    0b001,
    0b111,
    0b100,
    0b111
};

void axis_binome_numb(hls::stream<pkt> &A, bool draw2, hls::stream<pkt> &B) {
#pragma HLS INTERFACE axis port=A
#pragma HLS INTERFACE axis port=B
#pragma HLS PIPELINE II=1
#pragma HLS LATENCY min=1 max=1

    pkt tmp, t1;
    type mask;

    while (true) {
		for(int y = 0; y < 480; y++){
			for(int x = 0; x < 640; x++){
				A.read(tmp); // Read AXIS input
				t1 = tmp;

				// Select only the pixels located in the top left corner of the image
				if(draw2 && y < FONT_HEIGHT && x < FONT_WIDTH) {

					// Apply mask to select desired pixel
					mask = 1 << ((FONT_WIDTH - 1) - x);


					if((two[y] & mask)){
						// Display white pixel according to the Two symbol
						t1.data = 255;
					}
					else{
						t1.data = 0;
					}

				} else {
					// No modif of pixels input
					t1.data = tmp.data;
				}

				B.write(t1); // Write the result to the AXIS output
			}
		}
    }
}
