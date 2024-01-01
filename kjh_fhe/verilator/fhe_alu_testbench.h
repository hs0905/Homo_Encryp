#ifndef __FHE_ALU_TESTBENCH_H__
#define __FHE_ALU_TESTBENCH_H__

#include <verilated.h>
#include "Vfhe_alu_top.h"


#include <queue>
#include <map>
#include <vector>
#include <thread>
#include <mutex>


#include "defines.h"


struct CommandDataPort {
  uint8_t valid;
  uint8_t command;
  uint64_t command_data0;
  uint64_t command_data1;

  void ConvertFromPort(const WData* p_packed_val) {
    command_data1 = (p_packed_val[0]) |  ( (uint64_t)p_packed_val[1] << 32);
    command_data0 = (p_packed_val[2]) |  ( (uint64_t)p_packed_val[3] << 32);
    command = p_packed_val[4] & 0xFF;
    valid = (p_packed_val[4] >> 8) & 0x1;
  }

  void ConvertToPort(WData* p_packed_val) {
    p_packed_val[0] = command_data1;
    p_packed_val[1] = command_data1 >> 32;
    p_packed_val[2] = command_data0;
    p_packed_val[3] = command_data0 >> 32;
    p_packed_val[4] = command | (valid<<8);
  }
} ;



struct StatePort {
  uint64_t state0;
  uint64_t state1;
  uint64_t state2;
  uint64_t state3;

  void ConvertFromPort(const WData* p_packed_val) {
    state3 = (p_packed_val[0]) |  ( (uint64_t)(p_packed_val[1]) << 32UL);
    state2 = (p_packed_val[2]) |  ( (uint64_t)(p_packed_val[3]) << 32UL);
    state1 = (p_packed_val[4]) |  ( (uint64_t)(p_packed_val[5]) << 32UL);
    state0 = (p_packed_val[6]) |  ( (uint64_t)(p_packed_val[7]) << 32UL);    
  }

  void ConvertToPort(WData* p_packed_val) {
    p_packed_val[0] = state3;
    p_packed_val[1] = state3 >> 32;
    p_packed_val[2] = state2;
    p_packed_val[3] = state2 >> 32;
    p_packed_val[4] = state1;
    p_packed_val[5] = state1 >> 32;
    p_packed_val[6] = state0;
    p_packed_val[7] = state0 >> 32;
  }
} ;




#define COMMAND 0
#define COMMAND_STOP 4
#define COMMAND_DEBUG 5

#define DEBUG_TYPE_ALU 0

#define STATE 0

#define WAIT_STATE0 0
#define WAIT_STATE2 2



class FHEALUTestBench {
  private:
    Vfhe_alu_top* top;

    CommandDataPort cdp_zero;
    
    int64_t stop_cycle;

    //fake host program
    // std::thread host_thread;
    std::mutex mtx;

    std::queue<CommandDataPort> command_queue;
    std::queue<int>             command_id_queue;
    int                         state_id_req;
    int                         state_ready;

    StatePort      host_stateport;
    
    void host_function();
    void host_getstates(int type);
    void host_setcommand(int type, CommandDataPort command);
    void host_setdebug(int type, uint32_t id, uint32_t debug);


  public:
    void Control_Reset();
    void Control_Stop();

    void bitRevTest(uint32_t module);
    void transposeTest(uint32_t module,uint32_t tranpose_base, uint32_t barrel_store, uint32_t barrel_load);
    void transposeTest_M(uint32_t module,uint32_t tranpose_base, uint32_t barrel_store, uint32_t barrel_load);
    void permPatternGenerate(uint32_t pattern);
    void permPattern(uint32_t module,uint32_t pattern);
    void permPattern_M(uint32_t module,uint32_t pattern);
    void set_uint(uint32_t module);
    void NTT(uint32_t module,uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p);
    void NTT_M(uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p);
    void NTT_multi_for_one_q(uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p);
    void iNTT_multi_for_one_q(uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p);
    void iNTT(uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p);
    void iNTT_M(uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p);
    void vectorMultMod(uint32_t module,uint64_t p,uint64_t pq0,uint64_t pq1);
    void vectorBarrett(uint32_t module,uint64_t p,uint64_t pq0,uint64_t pq1);
    void vectorLazy(uint32_t module,uint64_t p);
    void vectorDecomp(uint32_t module,uint64_t shift, uint64_t decomp);
    void vectorAuto(uint32_t module,uint64_t p,uint64_t k, uint64_t auto_base, uint64_t auto_offset);
    void vectorAuto_M(uint32_t module,uint64_t p,uint64_t k, uint64_t auto_base, uint64_t auto_offset);
    void vectorScalarMultMod(uint32_t module,uint64_t p,uint64_t pq0,uint64_t pq1,uint64_t scalar);
    void vectorAddMod(uint32_t module,uint64_t p);
    void vectorAddModScalar(uint32_t module,uint64_t p,uint64_t scalar);
    void vectorSubMod(uint32_t module,uint64_t p);
    void LoadRootPows(uint64_t *scaledRootPows,uint64_t *scaledRootPowsQ);
    void LoadIRootPows(uint64_t *scaledRootPows,uint64_t *scaledRootPowsQ);
    void LoadNTTData(uint64_t *NTT_data);
    void StoreNTTData(uint64_t *NTT_data);
    void SetSlot(uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3, uint64_t slot_op4);
    void SetSlot_16_MODULE(uint64_t slot_op0, uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3
                                ,uint64_t slot_op4, uint64_t slot_op5, uint64_t slot_op6, uint64_t slot_op7
                                ,uint64_t slot_op8, uint64_t slot_op9, uint64_t slot_op10, uint64_t slot_op11
                                ,uint64_t slot_op12, uint64_t slot_op13, uint64_t slot_op14, uint64_t slot_op15
                                ,uint64_t slot_op16, uint64_t slot_op17, uint64_t slot_op18, uint64_t slot_op19
                                ,uint64_t slot_op20, uint64_t slot_op21, uint64_t slot_op22, uint64_t slot_op23
                                );
    void SetSlot_16_RAM(uint64_t slot_op0, uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3
                                ,uint64_t slot_op4, uint64_t slot_op5, uint64_t slot_op6, uint64_t slot_op7
                                ,uint64_t slot_op8, uint64_t slot_op9, uint64_t slot_op10, uint64_t slot_op11
                                ,uint64_t slot_op12, uint64_t slot_op13, uint64_t slot_op14, uint64_t slot_op15
                                ,uint64_t slot_op16, uint64_t slot_op17, uint64_t slot_op18, uint64_t slot_op19
                                ,uint64_t slot_op20, uint64_t slot_op21, uint64_t slot_op22, uint64_t slot_op23
                                ,uint64_t slot_op24, uint64_t slot_op25, uint64_t slot_op26, uint64_t slot_op27
                                ,uint64_t slot_op28, uint64_t slot_op29, uint64_t slot_op30, uint64_t slot_op31
                                ,uint64_t slot_op32, uint64_t slot_op33, uint64_t slot_op34, uint64_t slot_op35
                                ,uint64_t slot_op36, uint64_t slot_op37, uint64_t slot_op38, uint64_t slot_op39);
    void SetSlot_NTT(uint64_t slot_op1, uint64_t slot_op2,uint64_t slot_op3, uint64_t slot_op4);
    void SetSlot_ROOT(uint64_t slot_op1, uint64_t slot_op2,uint64_t slot_op3, uint64_t slot_op4,uint64_t slot_op5, uint64_t slot_op6,uint64_t slot_op7, uint64_t slot_op8);
    void SetPE(uint64_t pe);
    void Set_background(uint64_t host_N, uint64_t host_logn);
    void SetSlot_RING(uint64_t slot_op1, uint64_t slot_op2);
    void Control_WaitforIdle(uint32_t type);

    FHEALUTestBench(Vfhe_alu_top* _top) ;
    void initialize();
    bool step_cycle(vluint64_t cycle) ; //return false when stop
    void finish() ;
};



#endif // __FHE_ALU_TESTBENCH_H__
