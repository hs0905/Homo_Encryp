#include<verilated.h>
#include"Vmem.h"
#include"verilated_vcd_c.h"

int main(int argc, char** argv, char** env){
    if(0 && argc && argv && env){} // Prevent unused variable warnings
    Vmem* top = new Vmem;

    // wave dump setting code
    Verilated::traceEverOn(true);
    VerilatedVcdC* wave_fp = new VerilatedVcdC;
    int time = 0;
    top->trace(wave_fp, 999);
    printf("waveform file name is top.vcd\n");

    wave_fp->open("top.vcd");

 //test code
 //init code
 // reset operation
    top->CLK = 0;
    top->RSTN = 1;
    top->eval();
    wave_fp->dump(time++);

    top->RSTN = 0;
    top->eval();
    wave_fp->dump(time++);

    top->RSTN = 1;
    top->eval();
    wave_fp->dump(time++);
 // real operation
    while(time<50){ // idle state
        top->CLK = top->CLK ? 0 : 1;
        top->eval();
        wave_fp->dump(time++);
    }

    while(time<100){ // write state
         top->CLK = top->CLK ? 0 : 1;
         top->WR_EN = 1;
         top->WR_DATA = time;
         top->eval();
         wave_fp->dump(time++);
    }

    while(time<150){ // read state
         top->CLK = top->CLK ? 0 : 1;
         top->WR_EN = 0;
         top->RD_EN = 1;
         top->eval();
         wave_fp->dump(time++);
    }

    while
 // final model cleanup
    top->final();
    wave_fp->close();

    delete top;
    delete wave_fp;

    //final
    exit(0);
}
