#include "fhe_alu_testbench.h"

#include <iostream>

extern vluint64_t main_cycle;


void FHEALUTestBench::Control_WaitforIdle(uint32_t type)  {
  usleep(1000);

  while(true) {
    if(type == WAIT_STATE0) {
      host_getstates(STATE);
      if(host_stateport.state0 == STATE_IDLE)  break;
    }
    if(type == WAIT_STATE2) {
      host_getstates(STATE);
      if(host_stateport.state2 == STATE_IDLE)  break;
    }
  }
}



// void load_NTT_init_values(uint64_t *p,uint64_t *root,uint64_t *rootq,uint64_t *value,uint64_t *result);
void reference_NTT(uint64_t p,uint64_t *scaledRootPows,uint64_t *scaledRootPowsQ,uint64_t *NTT_data);

// void FHEALUTestBench::host_function()  {
//   // std::cout << "hello from member function" << std::endl;
//   usleep(10000);

//   Control_Reset();
//   usleep(10000);


//   uint64_t* scaledRootPows = (uint64_t*)malloc(N*sizeof(uint64_t));
//   uint64_t* scaledRootPowsQ = (uint64_t*)malloc(N*sizeof(uint64_t));
//   uint64_t* NTT_data = (uint64_t*)malloc(N*sizeof(uint64_t));
//   uint64_t* NTT_result = (uint64_t*)malloc(N*sizeof(uint64_t));
//   uint64_t p;

//   load_NTT_init_values(&p,scaledRootPows,scaledRootPowsQ,NTT_data,NTT_result);
  
//   butter_NTT(p,scaledRootPows,scaledRootPowsQ,NTT_data);

//   for(int i = 0; i < N; i++) {
//     if(NTT_data[i] != NTT_result[i]) {
//       std::cout << "result mismatch " << i << " " <<  NTT_data[i]  << " " <<  NTT_result[i]  << std::endl;
//       // break;
//     }
//   }

//   free(scaledRootPows);
//   free(scaledRootPowsQ);
//   free(NTT_data);
//   free(NTT_result);

//   Control_Stop();
// }

extern "C" void ext_Control_Reset(void* handle)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->Control_Reset();
}

extern "C" void ext_Control_Stop(void* handle)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->Control_Stop();
}

extern "C" void ext_Control_WaitforIdle(void* handle, uint32_t type)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->Control_WaitforIdle(type);
}

extern "C" void ext_bitRevTest(void* handle, uint32_t module)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->bitRevTest(module);
}

extern "C" void ext_transposeTest(void* handle, uint32_t module, uint32_t tranpose_base, uint32_t barrel_store, uint32_t barrel_load)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->transposeTest(module,tranpose_base,barrel_store,barrel_load);
}

extern "C" void ext_transposeTest_M(void* handle, uint32_t module, uint32_t tranpose_base, uint32_t barrel_store, uint32_t barrel_load)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->transposeTest_M(module,tranpose_base,barrel_store,barrel_load);
}

extern "C" void ext_permPatternGenerate(void* handle, uint32_t pattern) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->permPatternGenerate(pattern);
}


extern "C" void ext_permPattern(void* handle, uint32_t module, uint32_t pattern) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->permPattern(module,pattern);
}

extern "C" void ext_permPattern_M(void* handle, uint32_t module, uint32_t pattern) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->permPattern_M(module,pattern);
}

extern "C" void ext_set_uint(void* handle, uint32_t module) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->set_uint(module);
}

extern "C" void ext_vectorMultMod(void* handle, uint32_t module, uint64_t p,uint64_t pq0,uint64_t pq1)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->vectorMultMod(module,p,pq0,pq1);
}

extern "C" void ext_vectorBarrestReduction128(void* handle, uint32_t module, uint64_t p,uint64_t pq0,uint64_t pq1)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->vectorBarrett(module,p,pq0,pq1);
}

extern "C" void ext_vectorLazyReduction(void* handle, uint32_t module, uint64_t p)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->vectorLazy(module,p);
}

extern "C" void ext_vectorDecomp(void* handle, uint32_t module, uint64_t shift,uint64_t decomp)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->vectorDecomp(module,shift,decomp);
}

extern "C" void ext_Auto(void* handle, uint32_t module,uint64_t p, uint64_t k, uint64_t auto_base, uint64_t auto_offset) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->vectorAuto(module,p,k,auto_base,auto_offset);
}
extern "C" void ext_Auto_M(void* handle, uint32_t module,uint64_t p, uint64_t k, uint64_t auto_base, uint64_t auto_offset) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->vectorAuto_M(module,p,k,auto_base,auto_offset);
}

extern "C" void ext_vectorScalarMultMod(void* handle, uint32_t module, uint64_t p,uint64_t pq0,uint64_t pq1,uint64_t scalar)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->vectorScalarMultMod(module,p,pq0,pq1,scalar);
}
extern "C" void ext_vectorAddMod(void* handle, uint32_t module, uint64_t p)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->vectorAddMod(module,p);
}
extern "C" void ext_vectorAddModScalar(void* handle, uint32_t module, uint64_t p, uint64_t scalar)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->vectorAddModScalar(module,p,scalar);
}
extern "C" void ext_vectorSubMod(void* handle, uint32_t module, uint64_t p)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->vectorSubMod(module,p);
}

extern "C" void ext_NTT(void* handle, uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->NTT(module,ntt_levels,ntt_base_level,p);
}
extern "C" void ext_NTT_multi_for_one_q(void* handle, uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->NTT_multi_for_one_q(module,ntt_levels,ntt_base_level,p);
}
extern "C" void ext_iNTT_multi_for_one_q(void* handle, uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->iNTT_multi_for_one_q(module,ntt_levels,ntt_base_level,p);
}
extern "C" void ext_NTT_M(void* handle, uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->NTT_M(module,ntt_levels,ntt_base_level,p);
}

extern "C" void ext_iNTT(void* handle, uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->iNTT(module,ntt_levels,ntt_base_level,p);
}
extern "C" void ext_iNTT_M(void* handle, uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p)  {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->iNTT_M(module,ntt_levels,ntt_base_level,p);
}



extern "C" void ext_loadRootPows(void* handle, uint64_t *scaledRootPows, uint64_t *scaledRootPowsQ) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->LoadRootPows(scaledRootPows,scaledRootPowsQ);
}

extern "C" void ext_loadIRootPows(void* handle, uint64_t *scaledRootPows, uint64_t *scaledRootPowsQ) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->LoadIRootPows(scaledRootPows,scaledRootPowsQ);
}

extern "C" void ext_loadNTTData(void* handle, uint64_t *NTT_data) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->LoadNTTData(NTT_data);
}

extern "C" void ext_storeNTTData(void* handle, uint64_t *NTT_data) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->StoreNTTData(NTT_data);
}

//lazy reduction
extern "C" void ext_setSlot(void* handle, uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3, uint64_t slot_op4) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->SetSlot(slot_op1,slot_op2,slot_op3,slot_op4);
}

extern "C" void ext_setSlot_NTT(void* handle, uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3, uint64_t slot_op4) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->SetSlot_NTT(slot_op1,slot_op2,slot_op3,slot_op4);
}

extern "C" void ext_setSlot_ROOT(void* handle, uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3, uint64_t slot_op4
                                             , uint64_t slot_op5, uint64_t slot_op6,uint64_t slot_op7, uint64_t slot_op8) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->SetSlot_ROOT(slot_op1,slot_op2,slot_op3,slot_op4,slot_op5,slot_op6,slot_op7,slot_op8);
}

extern "C" void ext_setSlot_16_MODULE(void* handle, uint64_t slot_op0, uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3
                                ,uint64_t slot_op4, uint64_t slot_op5, uint64_t slot_op6, uint64_t slot_op7
                                ,uint64_t slot_op8, uint64_t slot_op9, uint64_t slot_op10, uint64_t slot_op11
                                ,uint64_t slot_op12, uint64_t slot_op13, uint64_t slot_op14, uint64_t slot_op15
                                ,uint64_t slot_op16, uint64_t slot_op17, uint64_t slot_op18, uint64_t slot_op19
                                ,uint64_t slot_op20, uint64_t slot_op21, uint64_t slot_op22, uint64_t slot_op23
                                ) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->SetSlot_16_MODULE(slot_op0,slot_op1,slot_op2,slot_op3,slot_op4,slot_op5,slot_op6,slot_op7
                  ,slot_op8,slot_op9,slot_op10,slot_op11,slot_op12,slot_op13,slot_op14,slot_op15
                  ,slot_op16,slot_op17,slot_op18,slot_op19,slot_op20,slot_op21,slot_op22,slot_op23);
}

extern "C" void ext_setSlot_16_RAM(void* handle, uint64_t slot_op0, uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3
                                ,uint64_t slot_op4, uint64_t slot_op5, uint64_t slot_op6, uint64_t slot_op7
                                ,uint64_t slot_op8, uint64_t slot_op9, uint64_t slot_op10, uint64_t slot_op11
                                ,uint64_t slot_op12, uint64_t slot_op13, uint64_t slot_op14, uint64_t slot_op15
                                ,uint64_t slot_op16, uint64_t slot_op17, uint64_t slot_op18, uint64_t slot_op19
                                ,uint64_t slot_op20, uint64_t slot_op21, uint64_t slot_op22, uint64_t slot_op23
                                ,uint64_t slot_op24, uint64_t slot_op25, uint64_t slot_op26, uint64_t slot_op27
                                ,uint64_t slot_op28, uint64_t slot_op29, uint64_t slot_op30, uint64_t slot_op31
                                ,uint64_t slot_op32, uint64_t slot_op33, uint64_t slot_op34, uint64_t slot_op35
                                ,uint64_t slot_op36, uint64_t slot_op37, uint64_t slot_op38, uint64_t slot_op39) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->SetSlot_16_RAM(slot_op0,slot_op1,slot_op2,slot_op3,slot_op4,slot_op5,slot_op6,slot_op7
                  ,slot_op8,slot_op9,slot_op10,slot_op11,slot_op12,slot_op13,slot_op14,slot_op15
                  ,slot_op16,slot_op17,slot_op18,slot_op19,slot_op20,slot_op21,slot_op22,slot_op23
                  ,slot_op24, slot_op25, slot_op26, slot_op27
                  ,slot_op28, slot_op29, slot_op30, slot_op31
                  ,slot_op32, slot_op33, slot_op34, slot_op35
                  ,slot_op36, slot_op37, slot_op38, slot_op39);
}

extern "C" void ext_setPE(void* handle, uint64_t pe) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->SetPE(pe);
}

extern "C" void ext_back_ground(void* handle, uint64_t host_N, uint64_t host_logn) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->Set_background(host_N, host_logn);
}

extern "C" void ext_setSlot_RING(void* handle, uint64_t slot_op1, uint64_t slot_op2) {
  FHEALUTestBench* fhe_tb = (FHEALUTestBench*)handle;
  fhe_tb->SetSlot_RING(slot_op1,slot_op2);
}

void butt(uint64_t* a, uint64_t* b, uint64_t W, uint64_t p, uint64_t pInv) {
	__uint128_t  U = *b * (__uint128_t )W;
	uint64_t U0 = U;
	uint64_t U1 = U >> 64ULL;
	uint64_t Q = U0 * pInv;
	__uint128_t  Hx = Q * (__uint128_t )p;
	uint64_t H = Hx >> 64ULL;
	uint64_t V = U1 < H ? U1 + p - H : U1 - H;
	*b = *a < V ? *a + p - V : *a - V;
	*a += V;
	if (*a > p) *a -= p;
}



  // int t= N/2;
  // int logt1 = logN;

  // for (int m = 1; m < N; m <<= 1) {
	// 	for (int i = 0; i < m; i++) {
	// 		int j1 = i << logt1;
	// 		int j2 = j1 + t - 1;
	// 		uint64_t W = scaledRootPows[m + i];

	// 		for (int j = j1; j <= j2; j++) {
	// 			std::cout << "m: " << m << " i: " << i << " j: " << j << " j1: " << j1 <<  " j2: " << j2<<  " t: " << t << " a[j]: " << NTT_data[j] <<  " a[j+t]: " << NTT_data[j+t] <<  " W: " << W << " p: " << p << " pInv: " << pInv ;
	// 			butt(&NTT_data[j], &NTT_data[j+t], W, p, pInv);
	// 			std::cout << " a[j]: " << NTT_data[j] <<  " a[j+t]: " << NTT_data[j+t] << std::endl;
	// 		}
	// 	}

	// 	t >>= 1;
	// 	logt1 -= 1;
	// }


// }

void FHEALUTestBench::Control_Reset() {
  CommandDataPort command;

  command.valid = 1;  
  command.command = COMMAND_RESET;
  host_setcommand(COMMAND,command);

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  
}

void FHEALUTestBench::Control_Stop() {
  CommandDataPort command;

  command.valid = 1;  
  command.command = 0;

  host_setcommand(COMMAND_STOP,command);  
}





void FHEALUTestBench::bitRevTest(uint32_t module) {
  CommandDataPort command;
  command.valid = 1;

  if(module == 0)
    command.command = COMMAND_BITREVERSE1;
  else if(module == 1)
    command.command = COMMAND_BITREVERSE2;

  command.command_data0 = 0;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  usleep(200);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);

  //usleep(1000);
  //host_getstates(STATE);
  //host_getstates(STATE);
  //host_getstates(STATE);
  //host_getstates(STATE);

  // printf("bit rev queue flush start\n");
  // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // mtx.unlock();
  // printf("bit rev flush finish\n");

  // usleep(1000);

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);

  
  
  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0); 
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
}

void FHEALUTestBench::transposeTest(uint32_t module,uint32_t tranpose_base, uint32_t barrel_store, uint32_t barrel_load) {
  CommandDataPort command;
  command.valid = 1;

  if(module == 0)
    command.command = COMMAND_TRANSPOSE1;
  else if(module == 1)
    command.command = COMMAND_TRANSPOSE2;
    
  command.command_data0 = tranpose_base;
  command.command_data1 = (barrel_store  << 16) | barrel_load ;
  host_setcommand(COMMAND,command); 

  usleep(100);
  
  // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // mtx.unlock();

  // usleep(1000);

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  
  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);  
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
}

void FHEALUTestBench::transposeTest_M(uint32_t module, uint32_t tranpose_base, uint32_t barrel_store, uint32_t barrel_load) {
  CommandDataPort command;
  command.valid = 1;

  if(module == 0)
    command.command = COMMAND_TRANSPOSE1;
  else if(module == 1)
    command.command = COMMAND_TRANSPOSE2;

  command.command_data0 = tranpose_base;
  command.command_data1 = (barrel_store  << 16) | barrel_load ;
  host_setcommand(COMMAND,command); 

  // command.command = 0;
  // command.command_data0 = 0;
  // command.command_data1 = 0;
  // host_setcommand(COMMAND,command);
  // host_setcommand(COMMAND,command); 
  // host_setcommand(COMMAND,command); 
  // host_setcommand(COMMAND,command);

  // usleep(100);
  
  // mtx.lock();
  // while(true) {
  //   if((command_id_queue.empty()) == true)
  //      break;
  // }
  // mtx.unlock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  printf("host_stateport.state0: %x\n",host_stateport.state0);
  
  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  // Control_WaitforIdle(WAIT_STATE0);  
  // std::cout << "We cycle: " << main_cycle <<std::endl;
}



void FHEALUTestBench::permPatternGenerate(uint32_t pattern) {
  CommandDataPort command;
  command.valid = 1;

  // command.command = COMMAND_PERM_PATTERN_GENERATE1;
  command.command_data0 = pattern;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  // usleep(1000);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  

  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);  
  // std::cout << "We cycle: " << main_cycle <<std::endl;
}



void FHEALUTestBench::permPattern(uint32_t module, uint32_t pattern) {
  CommandDataPort command;
  command.valid = 1;

  if(module == 0)
    command.command = COMMAND_PERM_PATTERN1;
  else if(module == 1)
    command.command = COMMAND_PERM_PATTERN2;

  command.command_data0 = pattern;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  // command.command = 0;
  // command.command_data0 = 0;
  // command.command_data1 = 0;
  // host_setcommand(COMMAND,command);
  // host_setcommand(COMMAND,command); 
  // host_setcommand(COMMAND,command); 
  // host_setcommand(COMMAND,command);

  usleep(100);
  // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // mtx.unlock();
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  
  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
}

void FHEALUTestBench::permPattern_M(uint32_t module, uint32_t pattern) {
  CommandDataPort command;
  command.valid = 1;

  if(module == 0)
    command.command = COMMAND_PERM_PATTERN1;
  else if(module == 1)
    command.command = COMMAND_PERM_PATTERN2;

  command.command_data0 = pattern;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  printf("host_stateport.state0: %x\n",host_stateport.state0);
  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  // Control_WaitforIdle(WAIT_STATE0);  
  // std::cout << "We cycle: " << main_cycle <<std::endl;
}

void FHEALUTestBench::set_uint(uint32_t module) {
  CommandDataPort command;
  command.valid = 1;

  if(module == 0)
    command.command = COMMAND_SET_UNIT1;
  else if(module == 1)
    command.command = COMMAND_SET_UNIT2;

  host_setcommand(COMMAND,command); 

  usleep(1000);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  
  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);  
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
}


void FHEALUTestBench::NTT(uint32_t module,uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  if(module == 0)
    command.command = COMMAND_NTT_RUN1;
  else if(module == 1)
    command.command = COMMAND_NTT_RUN2;
  else if(module == 2)
    command.command = COMMAND_NTT_RUN3;
  else if(module == 3)
    command.command = COMMAND_NTT_RUN4;
  command.command_data0 = ntt_levels;
  command.command_data1 = ntt_base_level;
  host_setcommand(COMMAND,command); 

  usleep(100);
  //host_getstates(STATE);
  //host_getstates(STATE);
  //host_getstates(STATE);
  //host_getstates(STATE);

  // printf("ntt queue flush start\n");
  // // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // // // mtx.unlock();
  // printf("ntt queue flush finish\n");

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // printf("host_stateport.state0: %x\n",host_stateport.state0);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);

  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}


void FHEALUTestBench::NTT_multi_for_one_q(uint32_t module,uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  command.command = COMMAND_MULTI_NTT_RUN1;
  command.command_data0 = (ntt_base_level  << 16) | ntt_levels;
  command.command_data1 = module;
  host_setcommand(COMMAND,command); 

  command.command = COMMAND_MULTI_NTT_RUN2;
  command.command_data0 = 0;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  usleep(100);
  //host_getstates(STATE);
  //host_getstates(STATE);
  //host_getstates(STATE);
  //host_getstates(STATE);

  // printf("ntt queue flush start\n");
  // // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // // // mtx.unlock();
  // printf("ntt queue flush finish\n");

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  printf("host_stateport.state0: %x\n",host_stateport.state0);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);

  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  // Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}

void FHEALUTestBench::iNTT_multi_for_one_q(uint32_t module,uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  command.command = COMMAND_MULTI_INTT_RUN1;
  command.command_data0 = (ntt_base_level  << 16) | ntt_levels;
  command.command_data1 = module;
  host_setcommand(COMMAND,command); 

  command.command = COMMAND_MULTI_INTT_RUN2;
  command.command_data0 = 0;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  usleep(100);
  //host_getstates(STATE);
  //host_getstates(STATE);
  //host_getstates(STATE);
  //host_getstates(STATE);

  // printf("ntt queue flush start\n");
  // // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // // // mtx.unlock();
  // printf("ntt queue flush finish\n");

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  printf("host_stateport.state0: %x\n",host_stateport.state0);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);

  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  // Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}

void FHEALUTestBench::NTT_M(uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  
  if(module == 0)
    command.command = COMMAND_NTT_RUN1;
  else if(module == 1)
    command.command = COMMAND_NTT_RUN2;
  else if(module == 2)
    command.command = COMMAND_NTT_RUN3;
  else if(module == 3)
    command.command = COMMAND_NTT_RUN4;
  // command.command_data0 = ntt_levels;
  // command.command_data1 = ntt_base_level; //((idx_bits_repeat & 0xFFFF) << 16) | ( & 0xFFFF);
  command.command_data0 = ntt_levels;
  command.command_data1 = ntt_base_level;
  host_setcommand(COMMAND,command); 

  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // command.command = 0;
  // command.command_data0 = 0;
  // command.command_data1 = 0;
  // host_setcommand(COMMAND,command);
  // host_setcommand(COMMAND,command); 
  // host_setcommand(COMMAND,command); 
  // host_setcommand(COMMAND,command); 
  //usleep(1000);
  //host_getstates(STATE);
  //host_getstates(STATE);
  //host_getstates(STATE);
  //host_getstates(STATE);
  
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);

  printf("host_stateport.state0: %x\n",host_stateport.state0);
  // printf("ntt queue flush start\n");
  // mtx.lock();
  // while(true) {
  //   if((command_id_queue.empty()) == true)
  //      break;
  // }
  // mtx.unlock();
  // printf("ntt queue flush finish\n");

  // host_getstates(STATE);
  // host_getstates(STATE);

  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  // Control_WaitforIdle(WAIT_STATE0);  
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}


void FHEALUTestBench::iNTT(uint32_t module,uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 
  
  if(module == 0)
    command.command = COMMAND_INTT_RUN1;
  else if(module == 1)
    command.command = COMMAND_INTT_RUN2;
  else if(module == 2)
    command.command = COMMAND_INTT_RUN3;
  else if(module == 3)
    command.command = COMMAND_INTT_RUN4;
  // command.command_data0 = ntt_levels;
  // command.command_data1 = ntt_base_level; //((idx_bits_repeat & 0xFFFF) << 16) | ( & 0xFFFF);
  command.command_data0 = ntt_levels;
  command.command_data1 = ntt_base_level;
  host_setcommand(COMMAND,command); 

  usleep(100);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);

  // printf("queue flush start\n");
  // // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // // mtx.unlock();
  // printf("queue flush finish\n");

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  printf("host_stateport.state0: %x\n",host_stateport.state0);

  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
  
}

void FHEALUTestBench::iNTT_M(uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 
  
  if(module == 0)
    command.command = COMMAND_INTT_RUN1;
  else if(module == 1)
    command.command = COMMAND_INTT_RUN2;
  else if(module == 2)
    command.command = COMMAND_INTT_RUN3;
  else if(module == 3)
    command.command = COMMAND_INTT_RUN4;
  // command.command_data0 = ntt_levels;
  // command.command_data1 = ntt_base_level; //((idx_bits_repeat & 0xFFFF) << 16) | ( & 0xFFFF);
  command.command_data0 = ntt_levels;
  command.command_data1 = ntt_base_level;
  host_setcommand(COMMAND,command); 

  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // command.command = 0;
  // command.command_data0 = 0;
  // command.command_data1 = 0;
  // host_setcommand(COMMAND,command);
  // host_setcommand(COMMAND,command); 
  // host_setcommand(COMMAND,command); 
  // host_setcommand(COMMAND,command);

  // usleep(100);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  printf("host_stateport.state0: %x\n",host_stateport.state0);
  // printf("queue flush start\n");
  // mtx.lock();
  // while(true) {
  //   if((command_id_queue.empty()) == true)
  //      break;
  // }
  // mtx.unlock();
  // printf("queue flush finish\n");

  // host_getstates(STATE);
  // host_getstates(STATE);

  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  // Control_WaitforIdle(WAIT_STATE0);  
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
  
}


void FHEALUTestBench::vectorMultMod(uint32_t module, uint64_t p,uint64_t pq0,uint64_t pq1) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 
  
  if(module == 0)
    command.command = COMMAND_VECTOR_MULT_MOD1;
  else if(module == 1)
    command.command = COMMAND_VECTOR_MULT_MOD2;

  command.command_data0 = pq0;
  command.command_data1 = pq1;
  host_setcommand(COMMAND,command); 

  usleep(100);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  
  // printf("vectorMultMod queue flush start\n");

  // mtx.lock();
  while(true) {
  host_getstates(STATE);
  host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // mtx.unlock();
  // printf("vectorMultMod queue flush finish\n");

  // usleep(1000);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);

  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}


void FHEALUTestBench::vectorBarrett(uint32_t module, uint64_t p,uint64_t pq0,uint64_t pq1) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  command.command = COMMAND_VECTOR_MULT_MOD_PQ;
  command.command_data0 = pq0;
  command.command_data1 = pq1;
  host_setcommand(COMMAND,command); 
  
  if(module == 0)
    command.command = COMMAND_VECTOR_BARRETT_REDUCTION1;
  else if(module == 1)
    command.command = COMMAND_VECTOR_BARRETT_REDUCTION2;

  command.command_data0 = 0;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  usleep(100);
  
  while(true) {
  host_getstates(STATE);
  host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // printf("vectorMultMod queue flush start\n");

  // mtx.lock();
  // while(true) {
    
  //   if((command_id_queue.empty()) == true)
  //      break;
  
  // }
  // mtx.unlock();
  // printf("vectorMultMod queue flush finish\n");

  // usleep(1000);
  // host_getstates(STATE);
  // host_getstates(STATE);

  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);  
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}

void FHEALUTestBench::vectorLazy(uint32_t module, uint64_t p) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 
  
  if(module == 0)
    command.command = COMMAND_VECTOR_LAZY_REDUCTION1;
  else if(module == 1)
    command.command = COMMAND_VECTOR_LAZY_REDUCTION2;

  command.command_data0 = 0;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  usleep(100);
  // printf("vectorMultMod queue flush start\n");

  // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // mtx.unlock();
  // printf("vectorMultMod queue flush finish\n");

  // usleep(1000);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);

  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);  
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}

void FHEALUTestBench::vectorDecomp(uint32_t module, uint64_t shift,uint64_t decomp) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = shift; //p
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 
  
  if(module == 0)
    command.command = COMMAND_VECTOR_DECOMP1;
  else if(module == 1)
    command.command = COMMAND_VECTOR_DECOMP2;

  command.command_data0 = decomp;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  usleep(100);
  while(true) {
  host_getstates(STATE);
  host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // printf("vectorMultMod queue flush start\n");

  // mtx.unlock();
  // printf("vectorMultMod queue flush finish\n");

  // usleep(1000);
  // host_getstates(STATE);
  // host_getstates(STATE);

  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0); 
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000); 
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}

void FHEALUTestBench::vectorAuto(uint32_t module, uint64_t p,uint64_t k, uint64_t auto_base, uint64_t auto_offset) {
  CommandDataPort command;
  command.valid = 1;
    
  // printf("ext_auto2\n");
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  if(module == 0)
    command.command = COMMAND_AUTO1;
  else if(module == 1)
    command.command = COMMAND_AUTO2;

  command.command_data0 = k;
  command.command_data1 = (auto_base  << 16) | auto_offset ;
  host_setcommand(COMMAND,command); 

  usleep(100);
  // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // mtx.unlock();
  // usleep(100);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // host_getstates(STATE);
  
  // printf("ext_auto3\n");
  Control_WaitforIdle(WAIT_STATE0); 
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // printf("ext_auto4\n");  
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}

void FHEALUTestBench::vectorAuto_M(uint32_t module, uint64_t p,uint64_t k, uint64_t auto_base, uint64_t auto_offset) {
  CommandDataPort command;
  command.valid = 1;
    
  // printf("ext_auto2\n");
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  if(module == 0)
    command.command = COMMAND_AUTO1;
  else if(module == 1)
    command.command = COMMAND_AUTO2;

  command.command_data0 = k;
  command.command_data1 = (auto_base  << 16) | auto_offset ;
  host_setcommand(COMMAND,command); 


  usleep(100);
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  
  // printf("host_stateport.state0: %x\n",host_stateport.state0);
  // printf("ext_auto3\n");
  // Control_WaitforIdle(WAIT_STATE0);
  // printf("ext_auto4\n");  
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  printf("host_stateport.state0: %x\n",host_stateport.state0);
  
}

void FHEALUTestBench::vectorScalarMultMod(uint32_t module, uint64_t p,uint64_t pq0,uint64_t pq1,uint64_t scalar) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 
  
  command.command = COMMAND_VECTOR_MULT_MOD_PQ;
  command.command_data0 = pq0;
  command.command_data1 = pq1;
  host_setcommand(COMMAND,command); 

  if(module == 0)
    command.command = COMMAND_VECTOR_SCALAR_MULT_MOD1;
  else if(module == 1)
    command.command = COMMAND_VECTOR_SCALAR_MULT_MOD2;

  command.command_data0 = scalar;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  usleep(100);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);

  // printf("vectorScalarMultMod queue flush start\n");
  // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // mtx.unlock();
  // printf("vectorScalarMultMod queue flush finish\n");

  // usleep(1000);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}

void FHEALUTestBench::vectorAddMod(uint32_t module, uint64_t p) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 
  
  if(module == 0)
    command.command = COMMAND_VECTOR_ADD_MOD1;
  else if(module == 1)
    command.command = COMMAND_VECTOR_ADD_MOD2;

  command.command_data0 = 0;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  usleep(100);
  

  // printf("vectorAddMod queue flush start\n");
  // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // mtx.unlock();
  // printf("vectorAddMod queue flush finish\n");

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // usleep(1000);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}
void FHEALUTestBench::vectorAddModScalar(uint32_t module, uint64_t p, uint64_t scalar) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 
  
  if(module == 0)
    command.command = COMMAND_VECTOR_ADD_MOD_SCALAR1;
  else if(module == 1)
    command.command = COMMAND_VECTOR_ADD_MOD_SCALAR2;

  command.command_data0 = scalar;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  usleep(100);
  

  // printf("vectorAddModScalar queue flush start\n");
  // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // mtx.unlock();
  // printf("vectorAddModScalar queue flush finish\n");
  // usleep(1000);
  // host_getstates(STATE);
  // host_getstates(STATE);

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}

void FHEALUTestBench::vectorSubMod(uint32_t module, uint64_t p) {
  CommandDataPort command;
  command.valid = 1;
    
  command.command = COMMAND_NTT_P;
  command.command_data0 = p;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 
  
  if(module == 0)
    command.command = COMMAND_VECTOR_SUB1;
  else if(module == 1)
    command.command = COMMAND_VECTOR_SUB2;

  command.command_data0 = 0;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 

  usleep(100);
  

  // printf("vectorSubMod queue flush start\n");
  // mtx.lock();
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // mtx.unlock();
  // printf("vectorSubMod queue flush finish\n");

  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // usleep(1000);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
  
}

void FHEALUTestBench::LoadNTTData(uint64_t* NTT_data) {
  CommandDataPort command;
  command.valid = 1;
   
  // usleep(100);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // printf("queue flush start\n");
  // usleep(1000);
  printf("load start\n");
  // while(true) {
  //   if((command_id_queue.empty()) == true)
  //      break;
  // }
  //printf("queue flush finish\n");

  for(int i = 0; i < N ; i ++) {
    command.command = COMMAND_NTT_A;
    command.command_data0 = NTT_data[i];
    command.command_data1 = 0;
    host_setcommand(COMMAND,command); 
  }
  // usleep(1000);

  
  // printf("queue flush start\n");
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // printf("load data start111\n");
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // }printf("queue finish\n");
  // printf("queue flush finish\n");
  // printf("load data start222\n");

  // usleep(1000);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);

  // printf("load ntt data queue flush start\n");
  // mtx.lock();
  // while(true) {
  //   if((command_id_queue.empty()) == true)
  //      break;
  // }
  // mtx.unlock();
  // printf("load ntt data queue flush finish\n");

  // usleep(1000);
  // host_getstates(STATE);
  // host_getstates(STATE);


  // std::cout << "Ws cycle: " << main_cycle <<std::endl;
  Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // std::cout << "We cycle: " << main_cycle <<std::endl;
}


void FHEALUTestBench::StoreNTTData(uint64_t* NTT_data) {
  CommandDataPort command;
  command.valid = 1;
  // printf("store start\n");
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  usleep(100);
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if(command_id_queue.empty() == true)
      // usleep(10);
      break;
  }
  // printf("store start\n");
  //Control_WaitforIdle(WAIT_STATE0);
  //printf("queue flush\n");
  // printf("55_1\n");
  for(int i = 0; i < N ; i ++) {

    
    command.command = COMMAND_NTT_GET;
    command.command_data0 = i;
    command.command_data1 = 0;
    host_setcommand(COMMAND,command);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    host_getstates(STATE);
    // host_getstates(STATE);
    //printf("%d\n", command_id_queue.empty());

    // original
    //host_getstates(STATE);
    //host_getstates(STATE);
    //host_getstates(STATE);

    
    //if(host_stateport.state0 != 0)
    NTT_data[i] = host_stateport.state1;
    // printf("result %d state1 %lx %lu\n",i,host_stateport.state1,host_stateport.state1);
  }

  //Control_WaitforIdle(WAIT_STATE0);
  
  // printf("queue flush start\n");
  //while(true) {
  //  if(command_id_queue.empty() == true)
  //     break;
  //}
  // usleep(1000);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // printf("55\n");
  Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // printf("66\n");
  // printf("queue flush finish\n");

  // printf("store finish\n");
}


void FHEALUTestBench::SetSlot(uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3, uint64_t slot_op4) {
  CommandDataPort command;
  command.valid = 1;

  //lazy reduction
  command.command = COMMAND_SET_MODULE1;
  command.command_data0 = (slot_op2<<32)|(slot_op1&0x00000000FFFFFFFF);
  command.command_data1 = (slot_op4<<32)|(slot_op3&0x00000000FFFFFFFF);
  // printf("command.command_data0 : %llx\n",command.command_data0);
  // printf("command.command_data1 : %llx\n",command.command_data1);
  host_setcommand(COMMAND,command); 
  // host_getstates(STATE);
  // host_getstates(STATE);

  
}

void FHEALUTestBench::SetSlot_16_MODULE(uint64_t slot_op0, uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3
                                ,uint64_t slot_op4, uint64_t slot_op5, uint64_t slot_op6, uint64_t slot_op7
                                ,uint64_t slot_op8, uint64_t slot_op9, uint64_t slot_op10, uint64_t slot_op11
                                ,uint64_t slot_op12, uint64_t slot_op13, uint64_t slot_op14, uint64_t slot_op15
                                ,uint64_t slot_op16, uint64_t slot_op17, uint64_t slot_op18, uint64_t slot_op19
                                ,uint64_t slot_op20, uint64_t slot_op21, uint64_t slot_op22, uint64_t slot_op23) {
  CommandDataPort command;
  command.valid = 1;

  command.command = COMMAND_SET_MODULE1;
  command.command_data0 = ((slot_op4<<(6*4))|(slot_op3<<(6*3))|(slot_op2<<(6*2))|(slot_op1<<(6*1))|(slot_op0<<(6*0)));
  command.command_data1 = ((slot_op9<<(6*4))|(slot_op8<<(6*3))|(slot_op7<<(6*2))|(slot_op6<<(6*1))|(slot_op5<<(6*0)));
  host_setcommand(COMMAND,command); 

  command.command = COMMAND_SET_MODULE2;
  command.command_data0 = ((slot_op14<<(6*4))|(slot_op13<<(6*3))|(slot_op12<<(6*2))|(slot_op11<<(6*1))|(slot_op10<<(6*0)));
  command.command_data1 = ((slot_op19<<(6*4))|(slot_op18<<(6*3))|(slot_op17<<(6*2))|(slot_op16<<(6*1))|(slot_op15<<(6*0)));
  host_setcommand(COMMAND,command); 
  
  command.command = COMMAND_SET_MODULE3;
  command.command_data0 = ((slot_op23<<(6*3))|(slot_op22<<(6*2))|(slot_op21<<(6*1))|(slot_op20<<(6*0)));
  host_setcommand(COMMAND,command);
  
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
}



void FHEALUTestBench::SetSlot_16_RAM(uint64_t slot_op0, uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3
                                ,uint64_t slot_op4, uint64_t slot_op5, uint64_t slot_op6, uint64_t slot_op7
                                ,uint64_t slot_op8, uint64_t slot_op9, uint64_t slot_op10, uint64_t slot_op11
                                ,uint64_t slot_op12, uint64_t slot_op13, uint64_t slot_op14, uint64_t slot_op15
                                ,uint64_t slot_op16, uint64_t slot_op17, uint64_t slot_op18, uint64_t slot_op19
                                ,uint64_t slot_op20, uint64_t slot_op21, uint64_t slot_op22, uint64_t slot_op23
                                ,uint64_t slot_op24, uint64_t slot_op25, uint64_t slot_op26, uint64_t slot_op27
                                ,uint64_t slot_op28, uint64_t slot_op29, uint64_t slot_op30, uint64_t slot_op31
                                ,uint64_t slot_op32, uint64_t slot_op33, uint64_t slot_op34, uint64_t slot_op35
                                ,uint64_t slot_op36, uint64_t slot_op37, uint64_t slot_op38, uint64_t slot_op39) {
  CommandDataPort command;
  command.valid = 1;

  command.command = COMMAND_SET_RAM1;
  command.command_data0 = ((slot_op5<<(5*5))|(slot_op4<<(5*4))
                                    |(slot_op3<<(5*3))|(slot_op2<<(5*2))|(slot_op1<<(5*1))|(slot_op0<<(5*0)));
  command.command_data1 = ((slot_op11<<(5*5))|(slot_op10<<(5*4))
                                    |(slot_op9<<(5*3))|(slot_op8<<(5*2))|(slot_op7<<(5*1))|(slot_op6<<(5*0)));
  host_setcommand(COMMAND,command); 

  command.command = COMMAND_SET_RAM2;
  command.command_data0 = ((slot_op17<<(5*5))|(slot_op16<<(5*4))
                                    |(slot_op15<<(5*3))|(slot_op14<<(5*2))|(slot_op13<<(5*1))|(slot_op12<<(5*0)));
  command.command_data1 = ((slot_op23<<(5*5))|(slot_op22<<(5*4))
                                    |(slot_op21<<(5*3))|(slot_op20<<(5*2))|(slot_op19<<(5*1))|(slot_op18<<(5*0)));
  host_setcommand(COMMAND,command); 

  command.command = COMMAND_SET_RAM3;
  command.command_data0 = ((slot_op29<<(5*5))|(slot_op28<<(5*4))
                                    |(slot_op27<<(5*3))|(slot_op26<<(5*2))|(slot_op25<<(5*1))|(slot_op24<<(5*0)));
  command.command_data1 = ((slot_op35<<(5*5))|(slot_op34<<(5*4))
                                    |(slot_op33<<(5*3))|(slot_op32<<(5*2))|(slot_op31<<(5*1))|(slot_op30<<(5*0)));
  host_setcommand(COMMAND,command); 

  command.command = COMMAND_SET_RAM4;
  command.command_data0 = ((slot_op39<<(5*3))|(slot_op38<<(5*2))|(slot_op37<<(5*1))|(slot_op36<<(5*0)));
  host_setcommand(COMMAND,command); 


  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // mtx.lock();
  // while(true) {
  //   if((command_id_queue.empty()) == true)
  //      break;
  // }
  // mtx.unlock();

}

void FHEALUTestBench::SetSlot_NTT(uint64_t slot_op1, uint64_t slot_op2,uint64_t slot_op3, uint64_t slot_op4) {
  CommandDataPort command;
  command.valid = 1;

  //lazy reduction
  command.command = COMMAND_SET_SLOT_NTT;
  command.command_data0 = ((slot_op2<<(3*1))|(slot_op1<<(3*0)));
  command.command_data1 = ((slot_op4<<(3*1))|(slot_op3<<(3*0)));
  // printf("command.command_data0 : %llx\n",command.command_data0);
  // printf("command.command_data1 : %llx\n",command.command_data1);
  host_setcommand(COMMAND,command); 
  // host_getstates(STATE);
  // host_getstates(STATE);
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // mtx.lock();
  // while(true) {
  //   if((command_id_queue.empty()) == true)
  //      break;
  // }
  // mtx.unlock();
}

void FHEALUTestBench::SetSlot_ROOT(uint64_t slot_op1, uint64_t slot_op2,uint64_t slot_op3, uint64_t slot_op4
                                  ,uint64_t slot_op5, uint64_t slot_op6,uint64_t slot_op7, uint64_t slot_op8) {
  CommandDataPort command;
  command.valid = 1;

  //lazy reduction
  command.command = COMMAND_SET_SLOT_ROOT;
  command.command_data0 = ((slot_op4<<(2*3))|(slot_op3<<(2*2))|(slot_op2<<(2*1))|(slot_op1<<(2*0)));
  command.command_data1 = ((slot_op8<<(2*3))|(slot_op7<<(2*2))|(slot_op6<<(2*1))|(slot_op5<<(2*0)));
  // printf("command.command_data0 : %llx\n",command.command_data0);
  // printf("command.command_data1 : %llx\n",command.command_data1);
  host_setcommand(COMMAND,command); 
  // host_getstates(STATE);
  // host_getstates(STATE);
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // mtx.lock();
  // while(true) {
  //   if((command_id_queue.empty()) == true)
  //      break;
  // }
  // mtx.unlock();
}

void FHEALUTestBench::SetPE(uint64_t pe) {
  CommandDataPort command;
  command.valid = 1;

  //lazy reduction
  command.command = COMMAND_NTT_GET_PE_SELECT;
  command.command_data0 = pe;
  command.command_data1 = 0;
  // printf("command.command_data0 : %llx\n",command.command_data0);
  // printf("command.command_data1 : %llx\n",command.command_data1);
  host_setcommand(COMMAND,command); 
  // host_getstates(STATE);
  // host_getstates(STATE);
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  // mtx.lock();
  // while(true) {
  //   if((command_id_queue.empty()) == true)
  //      break;
  // }
  // mtx.unlock();
}

void FHEALUTestBench::Set_background(uint64_t host_N, uint64_t host_logn) {
  CommandDataPort command;
  command.valid = 1;

  //lazy reduction
  command.command = COMMAND_SET_BACKGROUND1;
  command.command_data0 = host_N;
  command.command_data1 = host_logn;
  host_setcommand(COMMAND,command); 

  command.command = COMMAND_SET_BACKGROUND2;
  command.command_data0 = 0;
  command.command_data1 = 0;
  host_setcommand(COMMAND,command); 
  // host_getstates(STATE);
  // host_getstates(STATE);
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
}

void FHEALUTestBench::SetSlot_RING(uint64_t slot_op1, uint64_t slot_op2) {
  CommandDataPort command;
  command.valid = 1;

  //lazy reduction
  command.command = COMMAND_SET_RING;
  if(slot_op1 == 0) 
    command.command_data0 = 0;
  else
    command.command_data0 = (1 << slot_op1-1);

  if(slot_op2 == 0) 
    command.command_data1 = 0;
  else
    command.command_data1 = (1 << slot_op2-1);
  // command.command_data1 = (1 << slot_op2);
  // printf("command.command_data0 : %llx\n",command.command_data0);
  // printf("command.command_data1 : %llx\n",command.command_data1);
  host_setcommand(COMMAND,command); 
  // host_getstates(STATE);
  // host_getstates(STATE);
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);
  host_getstates(STATE);

  Control_WaitforIdle(WAIT_STATE0);
  host_getstates(STATE);
  host_getstates(STATE);
  usleep(1000);
  // mtx.lock();
  // while(true) {
  //   if((command_id_queue.empty()) == true)
  //      break;
  // }
  // mtx.unlock();
}


int bitrev2(unsigned int i, int bits) {
  unsigned int ori = i;
  unsigned int res = 0;
  for(int j = 0; j < bits; j++) {
    res <<=1;
    if(i & 0x1) res |= 0x1;
    i >>= 1;
  }
  // printf("rev %d(%x) -> %d(%x)\n",ori,ori,res,res);
  return res;
}

void FHEALUTestBench::LoadRootPows(uint64_t *scaledRootPows, uint64_t *scaledRootPowsQ) {
  CommandDataPort command;
  command.valid = 1;

  uint32_t level = 0;
  uint32_t level_max = 1;

  int chunk_idx = 1;

  int buffer_addr[logE] = {0};

  for(int base_level = 0; base_level < logN ; base_level += logE) {
    int level_offset = 0;
    int level_skip_offset = 0;
    
    if( base_level + logE > logN) {
      level_skip_offset = (logE - (logN % logE));
    }

    for(;level_offset + level_skip_offset < logE ; level_offset += 1) {
      int level = base_level + level_offset;

      int chunks = 1 << level;
      int chunks_per_addr = 1 << (level_offset+level_skip_offset);
      for(int chunk_addr = 0; chunk_addr < (chunks / chunks_per_addr) ; chunk_addr += 1) {
        
          
        for(int chunk_offset = 0; chunk_offset < chunks_per_addr ; chunk_offset += 1) {          
          command.command = COMMAND_NTT_W;
          command.command_data0 = scaledRootPows[chunk_idx];    
          command.command_data1 = (buffer_addr[level_offset+level_skip_offset] << 16) | (chunk_offset << 8) | ((level_offset+level_skip_offset) << 0);
          host_setcommand(COMMAND,command); 

          // printf("level:%d level_offset:%d chunk_idx:%d chunk_offset:%d chunk_addr:%d buffer_addr:%d chunks_per_addr:%d\n",level,level_offset+level_skip_offset,chunk_idx,chunk_offset,chunk_addr,buffer_addr[level_offset+level_skip_offset],chunks_per_addr);
          
          command.command = COMMAND_NTT_WQ;
          command.command_data0 = scaledRootPowsQ[chunk_idx];    
          host_setcommand(COMMAND,command); 

          chunk_idx++;
        }

        buffer_addr[level_offset+level_skip_offset]++;
      }      
    }    
  }
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
}


void FHEALUTestBench::LoadIRootPows(uint64_t *scaledRootPows, uint64_t *scaledRootPowsQ) {
  CommandDataPort command;
  command.valid = 1;

  uint32_t level = 0;
  uint32_t level_max = 1;

  int root_idx = 1;

  int buffer_addr[logE] = {0};

  for(int base_level = logN-logE; base_level + logE > 0 ; base_level -= logE) {
    int level_offset = 0;
    int level_skip_offset = 0;

    
    if( base_level < 0) {
      level_skip_offset = (logE - (logN % logE));
    }

    // printf("base_level %d level_skip_offset %d\n",base_level,level_skip_offset);

    for( level_offset = logE-1 - level_skip_offset;level_offset >= 0 ; level_offset -- ) {      
      int level = base_level + level_offset + level_skip_offset;

      int chunks = 1 << level;
      int chunks_per_addr = 1 << (level_offset);
      
      // printf("level_offset %d level %d chunks %d chunks_per_addr %d\n",level_offset,level,chunks,chunks_per_addr);

      for(int chunk_addr = 0; chunk_addr < (chunks / chunks_per_addr) ; chunk_addr += 1) {
        
          
        for(int chunk_offset = 0; chunk_offset < chunks_per_addr ; chunk_offset += 1) {          
          command.command = COMMAND_NTT_W;
          command.command_data0 = scaledRootPows[root_idx];    
          command.command_data1 = (buffer_addr[level_offset] << 16) | (chunk_offset << 8) | ((level_offset) << 0);
          host_setcommand(COMMAND,command); 

          // printf("level:%d level_offset:%d root_idx:%d chunk_offset:%d chunk_addr:%d buffer_addr:%d chunks_per_addr:%d\n",level,level_offset,root_idx,chunk_offset,chunk_addr,buffer_addr[level_offset],chunks_per_addr);
          
          command.command = COMMAND_NTT_WQ;
          command.command_data0 = scaledRootPowsQ[root_idx];    
          host_setcommand(COMMAND,command); 

          root_idx++;
        }

        buffer_addr[level_offset]++;
      }      
    }    
  }
  while(true) {
    host_getstates(STATE);
    host_getstates(STATE);
    if((command_id_queue.empty()) == true)
       break;
  }
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
  // host_getstates(STATE);
}
