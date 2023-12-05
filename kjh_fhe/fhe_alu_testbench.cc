
#include "fhe_alu_testbench.h"
#include "Vfhe_alu_top_fhe_alu_top.h"
#include <iostream>


void FHEALUTestBench::host_getstates(int type) {
  mtx.lock();
  mtx.unlock();
  state_ready = false;
  state_id_req = type;
  std::this_thread::yield();

  while(1) {
    mtx.lock();
    if(state_ready) {
      mtx.unlock();
      return;
    }

    mtx.unlock();
    std::this_thread::yield();
  }
}

void FHEALUTestBench::host_setcommand(int type, CommandDataPort command)  {
  usleep(100+rand()%100);
  mtx.lock();
  command_queue.push(command);
  command_id_queue.push(type);
  mtx.unlock();
}

void FHEALUTestBench::host_setdebug(int type, uint32_t id, uint32_t debug)  {
  mtx.lock();
  CommandDataPort debug_command;
  debug_command.command = type;
  debug_command.command_data0 = id;
  debug_command.command_data1 = debug;
  command_queue.push(debug_command);
  command_id_queue.push(COMMAND_DEBUG);
  mtx.unlock();
}


FHEALUTestBench::FHEALUTestBench(Vfhe_alu_top* _top) 
  : top(_top)
  {
  
  cdp_zero.valid = 0;
  cdp_zero.command = 0;
  cdp_zero.command_data0 = 0;
  cdp_zero.command_data1 = 0;

  stop_cycle = -1;
}


void FHEALUTestBench::initialize() {
  // Initial input values
  top->clk = 0;
  top->rstn = 1;
  
  cdp_zero.ConvertToPort(top->commanddataport);
  
  // host_thread = std::thread(&FHEALUTestBench::host_function, this);
}

bool FHEALUTestBench::step_cycle(vluint64_t cycle) {
  //reset
  top->rstn = 1;
  if(cycle < 20)  top->rstn = 0;

  // get state 
  {
    mtx.lock();
    if(state_id_req == STATE) {
      host_stateport.ConvertFromPort(top->stateport);
    }
    state_ready = true;
    mtx.unlock();
  }

  //set command
  {
    cdp_zero.ConvertToPort(top->commanddataport);
    
    mtx.lock();
    if(!command_id_queue.empty()) {
      int command_id = command_id_queue.front();
      CommandDataPort command = command_queue.front();
      command_id_queue.pop();
      command_queue.pop();

      // std::cout << "received command " << command_id << " " << (int)command.command << " at cycle " << cycle <<std::endl;

      if(command_id == COMMAND) {
        command.ConvertToPort(top->commanddataport);
      }
      else if(command_id == COMMAND_STOP) {
        stop_cycle = cycle + 100; //set stop cycle
        std::cout << "set  stop cycle at " << stop_cycle << " current cycle " << cycle<< std::endl;
      }
      else if(command_id == COMMAND_DEBUG) {
        uint32_t id = command.command_data0;
        uint32_t debug = command.command_data1;
        uint32_t type = command.command;
       
        std::cout << "COMMAND_DEBUG " <<type<< " " << debug << " cycle " << cycle<< std::endl;

        if(type == DEBUG_TYPE_ALU) top->fhe_alu_top->debug_set_alu(debug);
      }
    }

    mtx.unlock();    
  }
 
  if(stop_cycle == cycle)  return false; //stop

  return true;
}

void FHEALUTestBench::finish() {
  std::cout << "finish"<< std::endl;
  
  // host_thread.join();
  
  std::cout << "joined"<< std::endl;
}

