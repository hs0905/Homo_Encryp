#include <verilated.h>
#include "Vfhe_alu_top.h"

#include "fhe_alu_testbench.h"


#include <thread>


#define VM_TRACE 1
#if VM_TRACE
# include <verilated_vcd_c.h>
#endif


std::thread verilator_thread;

vluint64_t main_time = 0;
vluint64_t main_cycle = 0;

Vfhe_alu_top* top;
FHEALUTestBench *fhe_alu_tb;

void verilator_function(void* not_used);

double sc_time_stamp() {
    return main_time;  // Note does conversion to real, to match SystemC
}


#if VM_TRACE
VerilatedVcdC* tfp = NULL;
#endif

extern "C" void* init_verilator() {
  Verilated::debug(0); //0: off, 9: highest
  Verilated::randReset(2);

  // Verilated::commandArgs(argc, argv);

  top = new Vfhe_alu_top;
  fhe_alu_tb = new FHEALUTestBench(top);

  #if VM_TRACE
  const char* flag = Verilated::commandArgsPlusMatch("trace");
  if (flag && strcmp(flag, "+trace") == 0) {
    Verilated::traceEverOn(true);
    tfp = new VerilatedVcdC;
    top->trace(tfp, 99);  // 99 hierarchy levels
    Verilated::mkdir("logs");
    tfp->open("logs/dump.vcd");
    VL_PRINTF("Dumping wave into logs/dump.vcd\n");
  }
  #endif


  verilator_thread = std::thread(verilator_function, (void*)NULL);

  return fhe_alu_tb;   
}


void verilator_function(void* not_used)  {
  fhe_alu_tb->initialize();  
  
  while (!Verilated::gotFinish()) {
    main_time++; 
    top->clk = !top->clk;
              
    if(main_time % 2 == 0) {        
      main_cycle++;
    }       

    top->eval();

    if(main_time %2 == 1) {
      if( !fhe_alu_tb->step_cycle(main_cycle) ) break;
    }

    #if VM_TRACE
    // Dump trace data for this cycle
    if (tfp) tfp->dump(main_time);
    #endif


  }
}

extern "C" int deinit_verilator() { 
  verilator_thread.join();

  fhe_alu_tb->finish();

  top->final();

  #if VM_TRACE
  if (tfp) { tfp->close(); tfp = NULL; }
  #endif

  delete fhe_alu_tb; fhe_alu_tb = NULL;
  delete top; top = NULL;
}