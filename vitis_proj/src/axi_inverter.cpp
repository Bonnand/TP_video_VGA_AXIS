#include "ap_axi_sdata.h"
#include "hls_stream.h"

#define DWIDTH 8
typedef ap_int<DWIDTH> type;
typedef hls::axis<type, 0, 0, 0> pkt;

void axi_inverter(hls::stream<pkt> &A, bool VidOrig_nVideoInvI,
             hls::stream<pkt> &B)
{
#pragma HLS INTERFACE axis port=A
#pragma HLS INTERFACE axis port=B
#pragma HLS PIPELINE II=1
#pragma HLS LATENCY min=1 max=1


    pkt tmp, t1;
    A.read(tmp); // Read AXI Stream in

    t1 = tmp; // Copy others signal that data

    if (VidOrig_nVideoInvI) {
        t1.data = ~tmp.data; // Inversion
    } else {
        t1.data = tmp.data;
    }

    B.write(t1); //Write AXI Stream out
}
