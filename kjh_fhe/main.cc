#include <stdint.h>
#include <stdlib.h>
#include "defines.h"

#include <unistd.h>
#include <iostream>

void load_NTT_init_values(uint64_t *p,uint64_t *root,uint64_t *rootq,uint64_t *value,uint64_t *result);
// void load_NTT_N_16_init_values(uint64_t *p,uint64_t *root,uint64_t *rootq,uint64_t *value,uint64_t *result);
// void load_iNTT_init_values(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *root,uint64_t *rootq,uint64_t *value,uint64_t *result,uint64_t *scalar,uint64_t *scalar_div_p);
// void load_iNTT_N_16_init_values(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *root,uint64_t *rootq,uint64_t *value,uint64_t *result,uint64_t *scalar,uint64_t *scalar_div_p);
// void load_auto(uint64_t *coeff_count_power,uint64_t *modulus_value,uint64_t *galois_elt,uint64_t *auto_op1,uint64_t *auto_result);
// void load_auto_N_16(uint64_t *galois_elt,uint64_t *auto_op1,uint64_t *auto_result);
// void load_EltwiseAddMod_N_16(uint64_t *p,uint64_t *add_op1,uint64_t *add_op2,uint64_t *add_result);
// void load_res_multiply_poly_scalar_coeffmod_N_16(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *mult_scalar_op1,uint64_t* scalar, uint64_t *mult_scalar_result);

// void load_EltwiseAddMod(uint64_t *p,uint64_t *EltwiseAddMod_op1,uint64_t *EltwiseAddMod_op2,uint64_t *EltwiseAddMod_res);
// void load_EltwiseAddMod_scalar(uint64_t *p,uint64_t *EltwiseAddMod_scalar_op,uint64_t *scalar,uint64_t *EltwiseAddMod_scalar_res);
// void load_EltwiseMultMod(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *EltwiseMultMod_op1,uint64_t *EltwiseMultMod_op2,uint64_t *EltwiseMultMod_res);
// void load_EltwiseReduceMod(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *EltwiseReduceMod,uint64_t *EltwiseReduceMod_result);
// void load_res_multiply_poly_scalar_coeffmod(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *multiply_poly_scalar_coeffmod,uint64_t* scalar, uint64_t *multiply_poly_scalar_coeffmod_res);
// void load_reduce_2p(uint64_t *p,uint64_t *reduce_2p,uint64_t* reduce_2p_res);
// void load_reduce_4p(uint64_t *p,uint64_t *reduce_4p,uint64_t* reduce_4p_res);
// void load_barrett(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *barrett_reduction_128_op1,uint64_t *barrett_reduction_128_op2,uint64_t *barrett_reduction_128_res);
// void load_lazy(uint64_t *wide_innerresult_0,uint64_t *wide_innerresult_1,uint64_t *key,uint64_t *temp_decomp_coeff,uint64_t *wide_innerresult_0_res,uint64_t *wide_innerresult_1_res);
// void load_decomp(uint64_t *shift,uint64_t *decomposition_bit_count,uint64_t *encrypted_coeff_input,uint64_t *decomp_encrypted_result);


// void load_mod_ntt(uint64_t *p,uint64_t *rootpow,uint64_t *rootpowq,uint64_t *ntt_in,uint64_t *ntt_out);
// void load_mod_intt(uint64_t *p,uint64_t *rootpow,uint64_t *rootpowq,uint64_t *intt_in,uint64_t *intt_out);
// void load_mod_auto(uint64_t *p,uint64_t *galois_elt,uint64_t *auto_in,uint64_t *auto_out);
// void load_mod_trans(uint64_t *trans_in,uint64_t *trans_out);
// void load_mod_perm(uint64_t *perm_in,uint64_t *perm_out);

extern "C" void* init_verilator();
extern "C" int deinit_verilator();

extern "C" void ext_Control_Reset(void* handle);
extern "C" void ext_Control_Stop(void* handle);
extern "C" void ext_Control_WaitforIdle(void* handle, uint32_t type);
extern "C" void ext_butter_NTT(void* handle, uint64_t p,uint64_t *scaledRootPows,uint64_t *scaledRootPowsQ,uint64_t *NTT_data) ;
extern "C" void ext_butter_iNTT(void* handle, uint64_t p,uint64_t *scaledRootPows,uint64_t *scaledRootPowsQ,uint64_t *NTT_data) ;
extern "C" void ext_bitRevTest(void* handle, uint32_t module);
extern "C" void ext_transposeTest(void* handle, uint32_t module, uint32_t tranpose_base, uint32_t barrel_store, uint32_t barrel_load);
extern "C" void ext_transposeTest_M(void* handle, uint32_t module, uint32_t tranpose_base, uint32_t barrel_store, uint32_t barrel_load);
extern "C" void ext_permPatternGenerate(void* handle, uint32_t pattern);
extern "C" void ext_permPattern(void* handle, uint32_t module, uint32_t pattern);
extern "C" void ext_permPattern_M(void* handle, uint32_t module, uint32_t pattern);
extern "C" void ext_set_uint(void* handle, uint32_t module);
extern "C" void ext_NTT(void* handle, uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p) ;
extern "C" void ext_NTT_M(void* handle, uint32_t module,uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p) ;
extern "C" void ext_NTT_multi_for_one_q(void* handle, uint32_t module,uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p) ;
extern "C" void ext_iNTT_multi_for_one_q(void* handle, uint32_t module,uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p) ;
extern "C" void ext_iNTT(void* handle, uint32_t module, uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p) ;
extern "C" void ext_iNTT_M(void* handle, uint32_t module,uint32_t ntt_levels, uint32_t ntt_base_level, uint64_t p) ;
extern "C" void ext_vectorReduceMod(void* handle, uint32_t module, uint64_t p, uint64_t pq1);
extern "C" void ext_vectorMultMod(void* handle, uint32_t module, uint64_t p, uint64_t pq0, uint64_t pq1);
extern "C" void ext_vectorBarrestReduction128(void* handle, uint32_t module, uint64_t p, uint64_t pq0, uint64_t pq1);
extern "C" void ext_vectorLazyReduction(void* handle, uint32_t module, uint64_t p);
extern "C" void ext_vectorDecomp(void* handle, uint32_t module, uint64_t shift, uint64_t decomp);
extern "C" void ext_Auto(void* handle, uint32_t module,uint64_t p, uint64_t k, uint64_t auto_base, uint64_t auto_offset);
extern "C" void ext_Auto_M(void* handle, uint32_t module,uint64_t p, uint64_t k, uint64_t auto_base, uint64_t auto_offset);
extern "C" void ext_vectorScalarMultMod(void* handle, uint32_t module, uint64_t p, uint64_t pq0, uint64_t pq1, uint64_t scalar);
extern "C" void ext_vectorAddMod(void* handle, uint32_t module, uint64_t p);
extern "C" void ext_vectorAddModScalar(void* handle, uint32_t module, uint64_t p, uint64_t scalar);
extern "C" void ext_vectorSubMod(void* handle, uint32_t module, uint64_t p);

extern "C" void ext_loadRootPows(void* handle, uint64_t *scaledRootPows, uint64_t *scaledRootPowsQ) ;
extern "C" void ext_loadIRootPows(void* handle, uint64_t *scaledRootPows, uint64_t *scaledRootPowsQ) ;
extern "C" void ext_loadNTTData(void* handle, uint64_t *NTT_data);
extern "C" void ext_storeNTTData(void* handle, uint64_t *NTT_data);

extern "C" void ext_setSlot(void* handle, uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3, uint64_t slot_op4);
extern "C" void ext_setSlot_NTT(void* handle, uint64_t slot_op1, uint64_t slot_op2,uint64_t slot_op3, uint64_t slot_op4);
extern "C" void ext_setSlot_ROOT(void* handle, uint64_t slot_op1, uint64_t slot_op2,uint64_t slot_op3, uint64_t slot_op4
                                             , uint64_t slot_op5, uint64_t slot_op6,uint64_t slot_op7, uint64_t slot_op8);
extern "C" void ext_setSlot_16_MODULE(void* handle, uint64_t slot_op0, uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3
                                ,uint64_t slot_op4, uint64_t slot_op5, uint64_t slot_op6, uint64_t slot_op7
                                ,uint64_t slot_op8, uint64_t slot_op9, uint64_t slot_op10, uint64_t slot_op11
                                ,uint64_t slot_op12, uint64_t slot_op13, uint64_t slot_op14, uint64_t slot_op15
                                ,uint64_t slot_op16, uint64_t slot_op17, uint64_t slot_op18, uint64_t slot_op19
                                ,uint64_t slot_op20, uint64_t slot_op21, uint64_t slot_op22, uint64_t slot_op23);
extern "C" void ext_setSlot_16_RAM(void* handle, uint64_t slot_op0, uint64_t slot_op1, uint64_t slot_op2, uint64_t slot_op3
                                ,uint64_t slot_op4, uint64_t slot_op5, uint64_t slot_op6, uint64_t slot_op7
                                ,uint64_t slot_op8, uint64_t slot_op9, uint64_t slot_op10, uint64_t slot_op11
                                ,uint64_t slot_op12, uint64_t slot_op13, uint64_t slot_op14, uint64_t slot_op15
                                ,uint64_t slot_op16, uint64_t slot_op17, uint64_t slot_op18, uint64_t slot_op19
                                ,uint64_t slot_op20, uint64_t slot_op21, uint64_t slot_op22, uint64_t slot_op23
                                ,uint64_t slot_op24, uint64_t slot_op25, uint64_t slot_op26, uint64_t slot_op27
                                ,uint64_t slot_op28, uint64_t slot_op29, uint64_t slot_op30, uint64_t slot_op31
                                ,uint64_t slot_op32, uint64_t slot_op33, uint64_t slot_op34, uint64_t slot_op35
                                ,uint64_t slot_op36, uint64_t slot_op37, uint64_t slot_op38, uint64_t slot_op39);
extern "C" void ext_setPE(void* handle, uint64_t pe);
extern "C" void ext_back_ground(void* handle, uint64_t host_N, uint64_t host_logn);


int bitrev(unsigned int i, int bits) {
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

int bitrev_mask(unsigned int i, int bits) {
  unsigned int ori = i;
  unsigned int res = 0;

  unsigned int mask = (1<<bits) -1 ;
  unsigned int umask = ~mask;
  unsigned int invariant = i & umask;
  unsigned int variant = i & mask;
  
  for(int j = 0; j < bits; j++) {
    res <<=1;
    if(variant & 0x1) res |= 0x1;
    variant >>= 1;
  }
  res = res | invariant;
  // printf("rev %d(%x) -> %d(%x)\n",ori,ori,res,res);
  return res;
}


unsigned int transpose(unsigned int i, int bits, int base, int barrel_store, int barrel_load) {
  unsigned int ori = i;
  
  unsigned int row_mask = E-1;  
  unsigned int bits_in_row = i & row_mask;

  unsigned int bits_in_idx_low_mask = (1 << base) - 1;
  unsigned int bits_in_idx_mid_mask = (row_mask << base);
  unsigned int bits_in_idx_high_mask = 0xFFFFFFF << (base + logE);

  unsigned int idx = (i>>logE) ;
  unsigned int bits_in_idx_low = idx & bits_in_idx_low_mask;
  unsigned int bits_in_idx_mid = idx & bits_in_idx_mid_mask;
  unsigned int bits_in_idx_high = idx & bits_in_idx_high_mask;

  if(barrel_store != 0 && barrel_store < logE) {
    //reverse barrel for index -> value
    bits_in_idx_mid >>= base;
    bits_in_idx_mid = ((bits_in_idx_mid << barrel_store) & row_mask) | ((bits_in_idx_mid >> (logE- barrel_store))& row_mask);
    bits_in_idx_mid <<= base;
  }

  if(barrel_load != 0 && barrel_load < logE) {
    //reverse barrel for index -> value
    bits_in_row = ((bits_in_row << barrel_load) & row_mask) | ((bits_in_row >> (logE- barrel_load))& row_mask);
  }

  unsigned int res = (bits_in_idx_high <<logE) | (bits_in_row << (base + logE)) |  (bits_in_idx_low << logE) | (bits_in_idx_mid >> (base));

  // printf("rev %d(%x) -> %d(%x) %d %d %d %d %d m: %d %d %d\n",ori,ori,res,res,bits_in_idx_high,bits_in_row,bits_in_idx_low,bits_in_idx_mid,idx,bits_in_idx_high_mask,bits_in_idx_mid_mask,bits_in_idx_low_mask);
  return res;
}


#include <verilated.h>


void reference_iNTT(uint64_t p,uint64_t *scaledRootPows,uint64_t *scaledRootPowsQ,uint64_t *NTT_data,uint64_t scalar,uint64_t scalar_div_p,uint64_t *NTT_data_before_scalar) {
  uint64_t x;
  uint64_t y;
  
  size_t m =  N >> 1;
  size_t gap = 1;

  size_t root_idx = 0;
  size_t level = logN-1;
    
  for (; m >= 1; m >>= 1) {
    size_t offset = 0;

    for (size_t i = 0; i < m; i++)  {
      root_idx++;
      uint64_t r_quotient = scaledRootPowsQ[root_idx];
      uint64_t r_operand = scaledRootPows[root_idx];
    
      for (size_t j = 0; j < gap; j++)
      {
        x = NTT_data[offset + j];
        y = NTT_data[offset + gap+ j];
        
        

        uint64_t x_y = x + y;

        uint64_t tmp1 = x_y;
        if(x_y >= 2*p) tmp1 = x_y - 2*p;   //guard

        uint64_t tmp2 = x + 2*p - y; // sub
        
        uint64_t r_div_p = r_quotient;
        uint64_t tmp3 = (tmp2 * (__uint128_t)r_div_p) >> 64;
        uint64_t r_tmp2 =  r_operand * tmp2;
        uint64_t tmp4_1 = tmp3 * p;
        uint64_t tmp4 = r_tmp2 - tmp4_1;
        
        NTT_data[offset + j] = tmp1;
        NTT_data[offset + gap + j] = tmp4;

        //printf("ref lvl:%ld chunk_idx:%ld gapidx:%ld x:%lu y:%lu p:%lu pq:%lu res:%lu res2:%lu\n",level,i,j,x,y,r_operand,r_quotient,tmp1,tmp4);
      }
      offset += gap << 1;
    }
    gap <<= 1;

    // if(level == 10) break;
    level--;    
  }
  
  for (size_t j = 0; j < N; j++)
  {
    NTT_data_before_scalar[j] = NTT_data[j];
  }

  for (size_t j = 0; j < N; j++)
  {
      uint64_t x = NTT_data[j];

      uint64_t tmp1 = (x * (__uint128_t)scalar_div_p) >> 64;
      uint64_t tmp2 = scalar * x;
      uint64_t tmp3 = tmp1 * p;
      uint64_t tmp4 = tmp2 - tmp3;

      NTT_data[j] = tmp4;
  }
}

void reference_NTT(uint64_t p,uint64_t *scaledRootPows,uint64_t *scaledRootPowsQ,uint64_t *NTT_data) {
  uint64_t x;
  uint64_t y;
  
  size_t m = 1;
  size_t gap = N >> 1;

  size_t root_idx = 0;
  
  int level = 0;

  for (m = 1; m < N; m <<= 1) {
    size_t offset = 0;

    for (size_t i = 0; i < m; i++)  {
      root_idx++;
      uint64_t r_quotient = scaledRootPowsQ[root_idx];
      uint64_t r_operand = scaledRootPows[root_idx];
    
      for (size_t j = 0; j < gap; j++)
      {
        x = NTT_data[offset + j];
        y = NTT_data[offset + gap+ j];
        

        if(x >= 2*p) x-= 2*p;

        //v = MulRed(x,y,y',p) ==> MulRed(y, )
        
        uint64_t r_div_p = r_quotient; // (r * 2^w / p)
        uint64_t tmp1 = (y * (__uint128_t)r_div_p) >> 64; //  t
        uint64_t tmp2 = r_operand * y - tmp1 * p; // maybe tmp2 < p
        // no modula p

        //v = tmp2 = MulRed(y, r, r', p) r' = [y * 2^w / p]
        uint64_t tmp3 = x + tmp2; // X = x + v original z >= p --> z = z - p
        uint64_t tmp4 = x +2*p - tmp2; // Y = x - v
        // no modula p

        NTT_data[offset + j] = tmp3;
        NTT_data[offset + gap+j] = tmp4;

        printf("level %d chunk_idx %ld gap_idx %ld x:%ld(%ld) y:%ld(%ld) W %ld(%ld,%ld) -> x:%ld y:%ld\n",level,i,j,offset + j,x,offset + gap+j,y,root_idx,r_operand,r_quotient,tmp3,tmp4);
      }
      offset += gap << 1;
    }
    gap >>= 1;

    level ++;
  }
}



void __INTT() {
  uint64_t x;
  uint64_t y;
  
  size_t m =  N >> 1;
  size_t level = logN-1;
  size_t gap = 1;

  size_t root_idx = 0;
      
  for (; m >= 1; m >>= 1) {
    size_t offset = 0;

    size_t chunks = m;
    

    for (size_t i = 0; i < m; i++)  {
      root_idx++;
   
      for (size_t j = 0; j < gap; j++)
      {
        x = offset + j;
        y = offset + gap+ j;
        
        printf("level:%lu chunk:%lu/%lu gap:%lu/%lu offset:%lu x:%lu y:%lu root:%lu \n",level,i,chunks,j,gap,offset,offset + j,offset + gap+ j,root_idx);
        
      }
      offset += gap << 1;
    }
    gap <<= 1;
    level--;
  }
     


}




void NTT_sequence(void* handle) {
  uint64_t* scaledRootPows = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* scaledRootPowsQ = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* NTT_data = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* NTT_result = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t p;

  uint64_t* module_select[MODULE_NUM];
  uint64_t* slot_select[SLOT_NUM];
  uint64_t* ntt_intt_select[NTT_INTT_NUM];
  uint64_t* root_select[ROOT_POWER_NUM];
  
  printf("ntt_sequence start\n");
  
  load_NTT_init_values(&p,scaledRootPows,scaledRootPowsQ,NTT_data,NTT_result);

  // for(int i = 0; i < N; i++) {
  //   NTT_data[i] = i;
  // }

  // for(int i = 0; i < N; i++) {
  //   scaledRootPows[i] = i+N;
  //   scaledRootPowsQ[i] = i+N+N;
  // }

  // for(int i = 0; i < N; i++) {
    // printf("NTT_data[i] = %llu \n",NTT_data[i]);
  // }

  // ext_setSlot_16_MODULE(handle,0, 1,2, 3,4,5,6, 7,8 
  //                             ,9,10,11,12 ,13,14,15,16
  //                             ,17,18,19,20 ,21,22,23,24
  //                             ,25,25,27,28,29,30,31,32 ,33,34,35,36 ,37,38 ,39);

  ext_back_ground(handle,N,logN);

  ext_setPE(handle, 0);
  printf("load set start\n");
  ext_setSlot_NTT(handle,0,1,2,3);
  ext_setSlot_ROOT(handle,0,1,2,3,4,5,6,7);
  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
   usleep(1000);
  // ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  printf("load root start\n");
  ext_loadRootPows(handle,scaledRootPows,scaledRootPowsQ);
  usleep(1000);
  printf("load data start\n");
  ext_loadNTTData(handle,NTT_data);

  usleep(10000);

  printf("bit_rev start\n");
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //  0  1  2  3  4  5  6  7  8  9 10 11 | 12 13 14
  // printf("1\n");
  ext_bitRevTest(handle,0);
  //  0 13 12 11 10  9  8  7  6  5  4  3 | 3  2  1
  // printf("2\n");
  // ext_setSlot_16_MODULE(handle,6,1,2,3,4,5,0,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  printf("ntt start\n");
  // ext_setSlot_16_MODULE(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                             ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_setSlot_16_MODULE(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_NTT(handle,0,logE,0,p);
  // // 0 14 13 12 11 10  9  8  7  6  5  4  | 3  2  1
  // printf("3\n");
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,0,0,0);
  // // 0 14 13 12 11 10  9  8  7  3  2  1  | 6  5  4
  // printf("4\n");
  ext_setSlot_16_MODULE(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_NTT(handle,0,logE,3,p);
  // // 0 14 13 12 11 10  9  8  7  3  2  1  | 6  5  4
  // printf("5\n");
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,3,0,0);
  // // 0 14 13 12 11 10  6  5  4  3  2  1  | 9  8  7
  // printf("6\n");
  ext_setSlot_16_MODULE(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_NTT(handle,0,logE,6,p);
  // // 0 14 13 12 11 10  6  5  4  3  2  1  | 9  8  7
  // printf("7\n");
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,6,0,0);
  // // 0 14 13  9  8  7  6  5  4  3  2  1  |12 11 10

  ext_setSlot_16_MODULE(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_NTT(handle,0,logE,9,p);
  // // 0 14 13  9  8  7  6  5  4  3  2  1  |12 11 10
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,0,0,0);
  // // 0 14 13  9  8  7  6  5  4 12 11 10  | 3  2  1
  // printf("8\n");
  // // ext_permPatternGenerate(handle,2);
  ext_setSlot_16_MODULE(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_permPattern(handle,0,8);
  // // ext_setSlot(handle,1,0,2,3);
  // // 0 14 13 12 11 10  9  8  7  6  5  4  | 3  2  1 

  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,7,0,0);
  // // 0  3  2  1 11 10  9  8  7  6  5  4  |14 13 12 

  // // ext_permPatternGenerate(handle,7);
  ext_setSlot_16_MODULE(handle,3,2,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,1,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_permPattern(handle,0,9);
  // // ext_setSlot(handle,0,1,2,3);
  // // 0 11 10  9  8  7  6  5  4  3  2  1  |14 13 12 
  
  ext_setSlot_16_MODULE(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_NTT(handle,0,1,12,p);
  // // // 0 11 10  9  8  7  6  5  4  3  2  1  |14 13 12 

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,0,0,0);
  // // // 11 10 9  8  7  6  5  4  3 14 13 12  | 2  1  0
  // // printf("10\n");
  // // // ext_permPatternGenerate(handle,8);
  ext_setSlot_16_MODULE(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,0,1,1,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_permPattern(handle,0,12);
  // // // ext_setSlot(handle,1,0,2,3);
  // // // 14 13 12 11 10 9  8  7  6  5  4  3  | 2  1  0

  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_bitRevTest(handle,0);
  // // //  0  1  2  3  4  5  6  7  8  9  10|  11 12 13
  
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);

  //test for set uint
  // ext_set_uint(handle);  
  // ext_setSlot(handle,0,1,2,3);
  printf("store start\n");
  ext_storeNTTData(handle,NTT_data);
  // for(int i = 0; i < N; i++) {
  //   printf("NTT_result[%d] = %llu \n",i,NTT_data[i]);
  // }


  // for(unsigned int i = 0; i < N; i++) {
  //   if(NTT_data[i] != i) {
  //     std::cout << "result mismatch at:" << i << " got:" <<  NTT_data[i]  << std::endl;
  //     // break;
  //   }
  // }

  printf("check ntt result start\n");

  for(int i = 0; i < N; i++) {
    if(NTT_data[i] != NTT_result[i]) {
      std::cout << "ntt result mismatch " << i << " " <<  NTT_data[i]  << " " <<  NTT_result[i]  << std::endl;
      // break;
    }
  }  
  printf("check ntt result finish\n");

  
  free(scaledRootPows);
  free(scaledRootPowsQ);
  free(NTT_data);
  free(NTT_result);

  printf("ntt_sequence finish\n");
  printf("\n");
}

void NTT_sequence_logN_16(void* handle) {
  uint64_t* scaledRootPows = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* scaledRootPowsQ = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* NTT_data = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* NTT_result = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t p;

  uint64_t* module_select[MODULE_NUM];
  uint64_t* slot_select[SLOT_NUM];
  uint64_t* ntt_intt_select[NTT_INTT_NUM];
  uint64_t* root_select[ROOT_POWER_NUM];
  
  printf("ntt_sequence start\n");
  
  // load_NTT_N_16_init_values(&p,scaledRootPows,scaledRootPowsQ,NTT_data,NTT_result);

  for(int i = 0; i < N; i++) {
    NTT_data[i] = i;
  }

  // for(int i = 0; i < N; i++) {
  //   scaledRootPows[i] = i+N;
  //   scaledRootPowsQ[i] = i+N+N;
  // }

  // for(int i = 0; i < N; i++) {
    // printf("NTT_data[i] = %llu \n",NTT_data[i]);
  // }

  // ext_setSlot_16_MODULE(handle,0, 1,2, 3,4,5,6, 7,8 
  //                             ,9,10,11,12 ,13,14,15,16
  //                             ,17,18,19,20 ,21,22,23,24
  //                             ,25,25,27,28,29,30,31,32 ,33,34,35,36 ,37,38 ,39);

  ext_back_ground(handle,N,logN);

  ext_setPE(handle, 1);
  
  printf("load set start\n");
  ext_setSlot_NTT(handle,0,1,2,3);
  ext_setSlot_ROOT(handle,0,1,2,3,4,5,6,7);
  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
   usleep(1000);

  
  printf("load root start\n");
  ext_loadRootPows(handle,scaledRootPows,scaledRootPowsQ);
  usleep(1000);
  printf("load data start\n");
  ext_loadNTTData(handle,NTT_data);

  usleep(10000);


  // N = 2^16 use all bit
  printf("bit_rev start\n");
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //  0  1  2  3  4  5  6  7  8  9 10 11 12 | 13 14 15

  ext_bitRevTest(handle,0);
  // 15 14 13 12 11 10  9  8  7  6  5  4  3 | 2  1  0
  
  ext_setSlot_16_MODULE(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  // ext_NTT(handle,0,logE,0,p);
  // 15 14 13 12 11 10  9  8  7  6  5  4  3 | 2  1  0
  
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,0,0,0);
  // 15 14 13 12 11 10  9  8  7  6  2  1  0 | 5  4  3
  
  ext_setSlot_16_MODULE(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  // ext_NTT(handle,0,logE,3,p);
  // 15 14 13 12 11 10  9  8  7  6  2  1  0 | 5  4  3
  
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,3,0,0);
  // 15 14 13 12 11 10  9  5  4  3  2  1  0 | 8  7  6
  
  ext_setSlot_16_MODULE(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  // ext_NTT(handle,0,logE,6,p);
  // 15 14 13 12 11 10  9  5  4  3  2  1  0 | 8  7  6
  
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,6,0,0);
  // 15 14 13 12  8  7  6  5  4  3  2  1  0 |11 10  9

  ext_setSlot_16_MODULE(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  // ext_NTT(handle,0,logE,9,p);
  // 15 14 13 12  8  7  6  5  4  3  2  1  0 |11 10  9

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,9,0,0);
  // 15 11 10  9  8  7  6  5  4  3  2  1  0 |14 13 12

  ext_setSlot_16_MODULE(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  // ext_NTT(handle,0,logE,12,p);
  // 15 11 10  9  8  7  6  5  4  3  2  1  0 |14 13 12

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,0,0,0);
  // 15 11 10  9  8  7  6  5  4  3 14 13 12 | 2  1  0
  
  ext_setSlot_16_MODULE(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_permPattern(handle,0,13);
  // 15 14 13 12 11 10  9  8  7  6  5  4  3 | 2  1  0

  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,10,0,0);
  //  2  1  0 12 11 10  9  8  7  6  5  4  3 |15 14 13

  ext_setSlot_16_MODULE(handle,3,2,1,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,3,2,1,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_permPattern(handle,0,14);
  // 12 11 10  9  8  7  6  5  4  3  2  1  0 |15 14 13
  
  ext_setSlot_16_MODULE(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,5,1,2,3,4,0,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  // ext_NTT(handle,0,1,15,p);
  // 12 11 10  9  8  7  6  5  4  3  2  1  0 |15 14 13

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_transposeTest(handle,0,0,0,0);
  // 12 11 10  9  8  7  6  5  4  3 15 14 13 | 2  1  0

  ext_setSlot_16_MODULE(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_permPattern(handle,0,15);
  // 15 14 13 12 11 10  9  8  7  6  5  4  3 | 2  1  0

  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_bitRevTest(handle,0);
  // // //  0  1  2  3  4  5  6  7  8  9  10|  11 12 13
  
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);

  printf("store start\n");
  ext_storeNTTData(handle,NTT_data);
  // for(int i = 0; i < N; i++) {
  //   printf("NTT_result[%d] = %llu \n",i,NTT_data[i]);
  // }


  // for(unsigned int i = 0; i < N; i++) {
  //   if(NTT_data[i] != i) {
  //     std::cout << "result mismatch at:" << i << " got:" <<  NTT_data[i]  << std::endl;
  //     // break;
  //   }
  // }

  printf("check ntt result start\n");

  for(int i = 0; i < N; i++) {
    if(NTT_data[i] != NTT_result[i]) {
      std::cout << "ntt result mismatch " << i << " " <<  NTT_data[i]  << " " <<  NTT_result[i]  << std::endl;
      // break;
    }
  }  
  printf("check ntt result finish\n");

  
  free(scaledRootPows);
  free(scaledRootPowsQ);
  free(NTT_data);
  free(NTT_result);

  printf("ntt_sequence finish\n");
  printf("\n");
}

void iNTT_sequence(void* handle) {
  uint64_t* scaledRootPows = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* scaledRootPowsQ = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* NTT_data = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* NTT_result = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* NTT_result_before_scalar = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t p;
  uint64_t pq0;
  uint64_t pq1;
  uint64_t scalar;
  uint64_t scalar_div_p;
  
  uint64_t* NTT_data_ref = (uint64_t*)malloc(N*sizeof(uint64_t));

  printf("intt_sequence start\n");

  // load_iNTT_init_values(&p,&pq0,&pq1,scaledRootPows,scaledRootPowsQ,NTT_data,NTT_result,&scalar,&scalar_div_p);

  // for(int i = 0; i < N; i++) {
  //   scaledRootPows[i] = i;
  //   scaledRootPowsQ[i] = i;
  // }

  // // // for(int i = 0; i < N; i++) {
  // // //   printf("NTT_data[i] = %llu \n",NTT_data[i]);
  // // // }
  // for(int i = 0; i < N; i++) {
  //   NTT_data[i] = i;
  //   // printf("NTT_data[i] = %llu \n",NTT_data[i]);
  // }

  // for(int i = 0; i < N; i++) {
  //   NTT_data_ref[i] = NTT_data[i];
  // }

  ext_back_ground(handle,N,logN);
  
  ext_setPE(handle, 0);
  // reference_iNTT(p,scaledRootPows,scaledRootPowsQ,NTT_data_ref,scalar,scalar_div_p,NTT_result_before_scalar);
  ext_setSlot_NTT(handle,2,1,0,3);
  ext_setSlot_ROOT(handle,2,1,0,3,2,1,0,3);
  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  usleep(1000);
  ext_loadIRootPows(handle,scaledRootPows,scaledRootPowsQ);
  usleep(1000);
  ext_loadNTTData(handle,NTT_data);

  usleep(10000);
  ext_setSlot_NTT(handle,0,1,2,3);
  ext_setSlot_ROOT(handle,0,1,2,3,0,1,2,3);

   //  0  1  2  3  4  5  6  7  8  9 10 11 | 12 13 14
  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_iNTT(handle,0,logE,10,p);
  //  0  1  2  3  4  5  6  7  8  9 10 11 | 12 13 14

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,0,0,0);
  //  0  1  2  3  4  5  6  7  8 12 13 14 |  9 10 11

  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_iNTT(handle,0,logE,7,p);
  //  0  1  2  3  4  5  6  7  8 12 13 14 |  9 10 11
  
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,3,0,0);
  //  0  1  2  3  4  5  9 10 11 12 13 14 |  6  7  8

  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_iNTT(handle,0,logE,4,p);
  //  0  1  2  3  4  5  9 10 11 12 13 14 |  6  7  8

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,6,0,0);
  //  0  1  2  6  7  8  9 10 11 12 13 14 |  3  4  5

  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_iNTT(handle,0,logE,1,p);
  //  0  1  2  6  7  8  9 10 11 12 13 14 |  3  4  5 

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,0,0,0);
  //  0  1  2  6  7  8  9 10 11  3  4  5 | 12 13 14 
  
  ext_setSlot_16_MODULE(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  // ext_permPatternGenerate(handle,2);
  ext_permPattern(handle,0,8);
  // ext_setSlot(handle,1,0,2,3);
  //  0  1  2  3  4  5  6  7  8  9 10 11 | 12 13 14

  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,7,0,0);
  //  0 12 13 14  4  5  6  7  8  9 10 11 |  1  2  3

  ext_setSlot_16_MODULE(handle,3,2,1,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,3,2,1,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  // ext_permPatternGenerate(handle,3);
  ext_permPattern(handle,0,9);
  // ext_setSlot(handle,0,1,2,3);
  //  0  4  5  6  7  8  9 10 11 12 13 14 |  1  2  3

  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_iNTT(handle,0,1,0,p);
  //  0  4  5  6  7  8  9 10 11 12 13 14 |  1  2  3
  
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,0,0,0);
  //  0  4  5  6  7  8  9 10 11   1  2  3 | 12 13 14

  ext_setSlot_16_MODULE(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  // ext_permPatternGenerate(handle,6);
  ext_permPattern(handle,0,12);
  // ext_setSlot(handle,1,0,2,3);

  //  0  1  2  3  4  5  6  7  8  9 10 11 | 12 13 14
  ext_setSlot_16_MODULE(handle,0,11,2,3,4,5,6,7,8,9,10,1,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,11,2,3,4,5,6,7,8,9,10,1,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_vectorScalarMultMod(handle,0,p,pq0,pq1,scalar);

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_storeNTTData(handle,NTT_data);

  // for(int i = 0; i < N; i++) {
  //   printf("NTT_result[%d] = %llu \n",i,NTT_data[i]);
  // }

  printf("check intt result start\n");
  for(int i = 0; i < N; i++) {
    if(NTT_data[i] != NTT_result[i]) {
      std::cout << "intt INTT_result mismatch " << i << " " <<  NTT_data[i]  << " " <<  NTT_result[i]  << std::endl;
      // break;
    }
  }
  printf("check intt result finish\n");  
  
  free(scaledRootPows);
  free(scaledRootPowsQ);
  free(NTT_data);
  free(NTT_result);
  free(NTT_result_before_scalar);

  printf("intt_sequence finish\n");
  printf("\n");
}

void iNTT_sequence_logN_16(void* handle) {
  uint64_t* scaledRootPows = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* scaledRootPowsQ = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* NTT_data = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* NTT_result = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* NTT_result_before_scalar = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t p;
  uint64_t pq0;
  uint64_t pq1;
  uint64_t scalar;
  uint64_t scalar_div_p;
  
  uint64_t* NTT_data_ref = (uint64_t*)malloc(N*sizeof(uint64_t));

  printf("intt_sequence_logN_16 start\n");

  // load_iNTT_N_16_init_values(&p,&pq0,&pq1,scaledRootPows,scaledRootPowsQ,NTT_data,NTT_result,&scalar,&scalar_div_p);

  // for(int i = 0; i < N; i++) {
  //   scaledRootPows[i] = i;
  //   scaledRootPowsQ[i] = i;
  // }

  // // // for(int i = 0; i < N; i++) {
  // // //   printf("NTT_data[i] = %llu \n",NTT_data[i]);
  // // // }
  // for(int i = 0; i < N; i++) {
  //   NTT_data[i] = i;
  //   // printf("NTT_data[i] = %llu \n",NTT_data[i]);
  // }

  // for(int i = 0; i < N; i++) {
  //   NTT_data_ref[i] = NTT_data[i];
  // }

  ext_back_ground(handle,N,logN);
  
  ext_setPE(handle, 0);
  // reference_iNTT(p,scaledRootPows,scaledRootPowsQ,NTT_data_ref,scalar,scalar_div_p,NTT_result_before_scalar);
  ext_setSlot_NTT(handle,2,1,0,3);
  ext_setSlot_ROOT(handle,2,1,0,3,2,1,0,3);
  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  usleep(1000);
  ext_loadIRootPows(handle,scaledRootPows,scaledRootPowsQ);
  usleep(1000);
  ext_loadNTTData(handle,NTT_data);

  usleep(10000);
  ext_setSlot_NTT(handle,0,1,2,3);
  ext_setSlot_ROOT(handle,0,1,2,3,0,1,2,3);

  //  0  1  2  3  4  5  6  7  8  9 10 11 12 | 13 14 15
  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_iNTT(handle,0,logE,13,p);
  //  0  1  2  3  4  5  6  7  8  9 10 11 12 | 13 14 15

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,0,0,0);
  //  0  1  2  3  4  5  6  7  8  9 13 14 15 | 10 11 12

  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_iNTT(handle,0,logE,10,p);
  //  0  1  2  3  4  5  6  7  8  9 13 14 15 | 10 11 12
  
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,3,0,0);
  //  0  1  2  3  4  5  6 10 11 12 13 14 15 |  7  8  9

  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_iNTT(handle,0,logE,7,p);
  //  0  1  2  3  4  5  6 10 11 12 13 14 15 |  7  8  9

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,6,0,0);
  //  0  1  2  3  7  8  9 10 11 12 13 14 15 |  4  5  6

  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_iNTT(handle,0,logE,4,p);
  //  0  1  2  3  7  8  9 10 11 12 13 14 15 |  4  5  6

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,9,0,0);
  //  0  4  5  6  7  8  9 10 11 12 13 14 15 |  1  2  3

  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_iNTT(handle,0,logE,1,p);
  //  0  4  5  6  7  8  9 10 11 12 13 14 15 |  1  2  3

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,0,0,0);
  //  0  4  5  6  7  8  9 10 11 12  1  2  3 | 13 14 15
  
  ext_setSlot_16_MODULE(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_permPattern(handle,0,13);
  //  0  1  2  3  4  5  6  7  8  9 10 11 12 | 13 14 15

  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,10,0,0);
  // 13 14 15  3  4  5  6  7  8  9 10 11 12 |  0  1  2

  ext_setSlot_16_MODULE(handle,3,2,1,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,3,2,1,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_permPattern(handle,0,14);
  //  3  4  5  6  7  8  9 10 11 12 13 14 15 |  0  1  2

  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_iNTT(handle,0,1,0,p);
  //  3  4  5  6  7  8  9 10 11 12 13 14 15 |  0  1  2
  
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,0,0,0);
  //  3  4  5  6  7  8  9 10 11 12  0  1  2 | 13 14 15

  ext_setSlot_16_MODULE(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_permPattern(handle,0,15);
  //  0  1  2  3  4  5  6  7  8  9 10 11 12 | 13 14 15

  ext_setSlot_16_MODULE(handle,0,11,2,3,4,5,6,7,8,9,10,1,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,11,2,3,4,5,6,7,8,9,10,1,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_vectorScalarMultMod(handle,0,p,pq0,pq1,scalar);

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_storeNTTData(handle,NTT_data);

  // for(int i = 0; i < N; i++) {
  //   printf("NTT_result[%d] = %llu \n",i,NTT_data[i]);
  // }

  printf("check intt result start\n");
  for(int i = 0; i < N; i++) {
    if(NTT_data[i] != NTT_result[i]) {
      std::cout << "intt INTT_result mismatch " << i << " " <<  NTT_data[i]  << " " <<  NTT_result[i]  << std::endl;
      // break;
    }
  }
  printf("check intt result finish\n");  
  
  free(scaledRootPows);
  free(scaledRootPowsQ);
  free(NTT_data);
  free(NTT_result);
  free(NTT_result_before_scalar);

  printf("intt_sequence finish\n");
  printf("\n");
}

void Auto_sequence(void* handle) {
  uint64_t* NTT_data = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* NTT_result = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t coeff_count_power;
  uint64_t p;
  uint64_t galois_elt;
  printf("auto_sequence start\n");


  // load_auto(&coeff_count_power,&p,&galois_elt,NTT_data,NTT_result);

  // for(int i = 0; i < N; i++) {
  //   NTT_data[i] = i;
  // }
  // p = 10000;
  // galois_elt = 653;

  ext_back_ground(handle,N,logN);

  ext_setPE(handle, 1);
  // ext_setSlot(handle,0,1,2,3);
  ext_setSlot_NTT(handle,0,1,2,3);
  ext_setSlot_ROOT(handle,0,1,2,3,4,5,6,7);
  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);

  ext_loadNTTData(handle,NTT_data);

  usleep(10000);

  //  0  1  2  3  4  5  6  7  8  9 | 10 11 12
  printf("ext_auto\n");
  ext_setSlot_16_MODULE(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_Auto(handle,0,p,galois_elt,0,0);
  //  0  1  2  3  4  5  6  7  8  9 | 10 11 12
  printf("ext_trans\n");
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,0,0,0);
  //  0  1  2  3  4  5  6  10 11 12 | 7  8  9
  printf("ext_auto\n");
  ext_setSlot_16_MODULE(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_Auto(handle,0,p,galois_elt,3,0);
  //  0  1  2  3  4  5  6  10 11 12 | 7  8  9
  printf("ext_trans\n");
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,3,0,0);
  //  0  1  2  3  7  8  9  10 11 12 | 4  5  6
  printf("ext_auto\n");
  ext_setSlot_16_MODULE(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_Auto(handle,0,p,galois_elt,6,0);
  //  0  1  2  3  7  8  9  10 11 12 | 4  5  6
  printf("ext_trans\n");
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,6,0,0);
  //  0  4  5  6  7  8  9  10 11 12 | 1  2  3 
  printf("ext_auto\n");
  ext_setSlot_16_MODULE(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_Auto(handle,0,p,galois_elt,9,0);
  //  0  4  5  6  7  8  9  10 11 12 | 1  2  3 
  printf("ext_trans\n");
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,0,0,0);
  //  0  4  5  6  7  8  9  1  2  3  | 10 11 12

  // ext_permPatternGenerate(handle,3);
  ext_setSlot_16_MODULE(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_permPattern(handle,0,8);
  // ext_setSlot(handle,1,0,2,3);
  // ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
  //  0  1  2  3  4  5  6  7  8  9  | 10 11 12

  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,7,0,0);
  //  10 11 12 3  4  5  6  7  8  9  | 0  1  2 


  // ext_permPatternGenerate(handle,4);
  ext_setSlot_16_MODULE(handle,3,2,1,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,3,2,1,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_permPattern(handle,0,9);
  // ext_setSlot(handle,0,1,2,3);
  // ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
  //  3  4  5  6  7  8  9  10 11 12 | 0  1  2
  printf("ext_auto\n");
  ext_setSlot_16_MODULE(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_Auto(handle,0,p,galois_elt,10,2);
  //  3  4  5  6  7  8  9  10 11 12 | 0  1  2
  
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,0,0,0);
  //  3  4  5  6  7  8  9  0  1  2  | 10 11 12 

  // ext_permPatternGenerate(handle,5);
  ext_setSlot_16_MODULE(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_permPattern(handle,0,12);
  // ext_setSlot(handle,1,0,2,3);
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  //  0  1  2  3  4  5  6  7  8  9   | 10 11 12 

  ext_storeNTTData(handle,NTT_data);

  printf("check auto result start\n");
  for(int i = 0; i < N; i++) {
    if(NTT_data[i] != NTT_result[i]) {
      // std::cout << "auto auto_result mismatch " << i << " " <<  NTT_data[i]  << " " <<  NTT_result[i]  << std::endl;
      // // break;
      printf("auto auto_result mismatch %d %ld %ld\n",i,NTT_data[i],NTT_result[i]);
    }
  }
  printf("check auto result finish\n");  
  printf("\n");

  free(NTT_data);
  free(NTT_result);
}

void Auto_sequence_logN_16(void* handle) {
  uint64_t* NTT_data = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* NTT_result = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t coeff_count_power;
  uint64_t p;
  uint64_t galois_elt;
  printf("auto_sequence_logN_16 start\n");


  // load_auto_N_16(&galois_elt,NTT_data,NTT_result);

  // for(int i = 0; i < N; i++) {
  //   NTT_data[i] = i;
  // }
  p = 0;
  // galois_elt = 653;

  ext_back_ground(handle,N,logN);

  ext_setPE(handle, 1);
  ext_setSlot_NTT(handle,0,1,2,3);
  ext_setSlot_ROOT(handle,0,1,2,3,4,5,6,7);
  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);

  ext_loadNTTData(handle,NTT_data);

  usleep(10000);

  //  0  1  2  3  4  5  6  7  8  9 10 11 12 | 13 14 15
  ext_setSlot_16_MODULE(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_Auto(handle,0,p,galois_elt,0,0);
  //  0  1  2  3  4  5  6  7  8  9 10 11 12 | 13 14 15

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,0,0,0);
  //  0  1  2  3  4  5  6  7  8  9 13 14 15 | 10 11 12

  ext_setSlot_16_MODULE(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_Auto(handle,0,p,galois_elt,3,0);
  //  0  1  2  3  4  5  6  7  8  9 13 14 15 | 10 11 12
  
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,3,0,0);
  //  0  1  2  3  4  5  6 10 11 12 13 14 15 |  7  8  9

  ext_setSlot_16_MODULE(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_Auto(handle,0,p,galois_elt,6,0);
  //  0  1  2  3  4  5  6 10 11 12 13 14 15 |  7  8  9

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,6,0,0);
  //  0  1  2  3  7  8  9 10 11 12 13 14 15 |  4  5  6

  ext_setSlot_16_MODULE(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_Auto(handle,0,p,galois_elt,9,0);
  //  0  1  2  3  7  8  9 10 11 12 13 14 15 |  4  5  6

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,9,0,0);
  //  0  4  5  6  7  8  9 10 11 12 13 14 15 |  1  2  3

  ext_setSlot_16_MODULE(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_Auto(handle,0,p,galois_elt,12,0);
  //  0  4  5  6  7  8  9 10 11 12 13 14 15 |  1  2  3

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,0,0,0);
  //  0  4  5  6  7  8  9 10 11 12  1  2  3 | 13 14 15
  
  ext_setSlot_16_MODULE(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_permPattern(handle,0,13);
  //  0  1  2  3  4  5  6  7  8  9 10 11 12 | 13 14 15

  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,10,0,0);
  // 13 14 15  3  4  5  6  7  8  9 10 11 12 |  0  1  2

  ext_setSlot_16_MODULE(handle,3,2,1,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,3,2,1,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_permPattern(handle,0,14);
  //  3  4  5  6  7  8  9 10 11 12 13 14 15 |  0  1  2

  ext_setSlot_16_MODULE(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_Auto(handle,0,p,galois_elt,13,2);
  //  3  4  5  6  7  8  9 10 11 12 13 14 15 |  0  1  2
  
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_transposeTest(handle,0,0,0,0);
  //  3  4  5  6  7  8  9 10 11 12  0  1  2 | 13 14 15

  ext_setSlot_16_MODULE(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,2,3,0,1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
  ext_permPattern(handle,0,15);
  //  0  1  2  3  4  5  6  7  8  9 10 11 12 | 13 14 15

  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);

  ext_storeNTTData(handle,NTT_data);

  printf("check auto result start\n");
  for(int i = 0; i < N; i++) {
    if(NTT_data[i] != NTT_result[i]) {
      // std::cout << "auto auto_result mismatch " << i << " " <<  NTT_data[i]  << " " <<  NTT_result[i]  << std::endl;
      // // break;
      printf("auto auto_result mismatch %d %ld %ld\n",i,NTT_data[i],NTT_result[i]);
    }
  }
  printf("check auto result finish\n");  
  printf("\n");

  free(NTT_data);
  free(NTT_result);
}

void Vector_sequence(void* handle, int test) {
  uint64_t* op1 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* op2 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* op3 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* op4 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* res1 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* res2 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* ref_res1 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* ref_res2 = (uint64_t*)malloc(N*sizeof(uint64_t));
  
  uint64_t p;
  uint64_t pq0;
  uint64_t pq1;
  uint64_t scalar;

  ext_back_ground(handle,N,logN);
  ext_setPE(handle, 0);
  ext_setSlot_NTT(handle,0,1,2,3);
  ext_setSlot_ROOT(handle,0,1,2,3,4,5,6,7);
  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
   usleep(1000);
  printf("test %d start\n", test);
  //multi
  // if(test == 0) {
  //   load_EltwiseReduceMod(&p,&pq0,&pq1,op1,ref_res1);
  //   // ext_setSlot(handle,0,1,2,3);
  //   ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //    ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                             ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_loadNTTData(handle,op1);
  //   ext_setSlot_16_MODULE(handle,21,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,0,22,23);
  //    ext_setSlot_16_RAM(handle,21,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,0,22,23
  //                             ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_vectorScalarMultMod(handle,0,p,pq0,pq1,1);
  //   ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //    ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                             ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_storeNTTData(handle,res1);
  // }
  // //multi
  // if(test == 1) {    
  //   load_EltwiseMultMod(&p,&pq0,&pq1,op1,op2,ref_res1);
  //   // ext_setSlot(handle,0,1,2,3);
  //   ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_loadNTTData(handle,op1);
  //   ext_Control_Reset(handle);
  //   // ext_setSlot(handle,1,0,2,3);
  //   ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_loadNTTData(handle,op2);
  //   // ext_setSlot(handle,0,1,2,3);
  //   ext_setSlot_16_MODULE(handle,23,24,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,1);
  //      ext_setSlot_16_RAM(handle,24,23,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,0
  //                               ,1,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_vectorMultMod(handle,1,p,pq0,pq1);
  //   ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_storeNTTData(handle,res1);
  // }

  if(test == 2) {    
    // load_res_multiply_poly_scalar_coeffmod_N_16(&p,&pq0,&pq1,op1,&scalar,ref_res1);
    // ext_setSlot(handle,0,1,2,3);
    ext_setSlot_16_MODULE(handle,11,1,2,3,4,5,6,7,8,9,10,0,12,13,14,15,16,17,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,11,1,2,3,4,5,6,7,8,9,10,0,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
    ext_loadNTTData(handle,op1);
    ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,21,18,19,20,17,22,23);
       ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,21,18,19,20,17,22,23
                                ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
    ext_vectorScalarMultMod(handle,0,p,pq0,pq1,scalar);
    ext_setSlot_16_MODULE(handle,11,1,2,3,4,5,6,7,8,9,10,0,12,13,14,15,16,17,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,11,1,2,3,4,5,6,7,8,9,10,0,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
    ext_storeNTTData(handle,res1);
  }
  

  if(test == 3) {    
    // load_EltwiseAddMod_N_16(&p,op1,op2,ref_res1);
    for(int i = 0; i < N; i++) {
      op1[i] = i;
    }
    for(int i = 0; i < N; i++) {
      op2[i] = 10;
    }


    // ext_setSlot(handle,0,1,2,3);
    ext_setSlot_16_MODULE(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
    ext_loadNTTData(handle,op1);
    ext_Control_Reset(handle);
    // ext_setSlot(handle,1,0,2,3);
    ext_setSlot_16_MODULE(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
    ext_loadNTTData(handle,op2);
    // ext_setSlot(handle,0,1,2,3);
    ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,23,22,19,20,21,18,17);
       ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,23,22,19,20,21,18,17
                                ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
    ext_vectorAddMod(handle,0,p);
    ext_setSlot_16_MODULE(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
    ext_storeNTTData(handle,res1);
  }
  

  // if(test == 4) {    
  //   load_EltwiseAddMod_scalar(&p,op1,&scalar,ref_res1);
  //   // ext_setSlot(handle,0,1,2,3);
  //   ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_loadNTTData(handle,op1);
  //   ext_setSlot_16_MODULE(handle,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,0,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,0,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_vectorAddModScalar(handle,1,p,scalar);
  //   ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_storeNTTData(handle,res1);
  // }
  

  // if(test == 5) {    
  //   load_reduce_2p(&p,op1,ref_res1);
  //   // ext_setSlot(handle,0,1,2,3);
  //   ext_setSlot_16_MODULE(handle,8,1,2,3,4,5,6,7,0,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,8,1,2,3,4,5,6,7,0,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_loadNTTData(handle,op1);
  //   ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,17,9,10,11,12,13,14,15,16,8,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,17,9,10,11,12,13,14,15,16,8,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_vectorAddModScalar(handle,0,p,0);
  //   ext_setSlot_16_MODULE(handle,8,1,2,3,4,5,6,7,0,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,8,1,2,3,4,5,6,7,0,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_storeNTTData(handle,res1);
  // }
  

  // if(test == 6) {    
  //   load_reduce_4p(&p,op1,ref_res1);
  //   // ext_setSlot(handle,0,1,2,3);
  //   ext_setSlot_16_MODULE(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_loadNTTData(handle,op1);
  //   ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,19,11,12,13,14,15,16,17,18,10,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,19,11,12,13,14,15,16,17,18,10,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_vectorAddModScalar(handle,1,p,0);
  //   ext_setSlot_16_MODULE(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_storeNTTData(handle,res1);
  // }

  // // if(test == 1) {    
  // //   load_EltwiseMultMod(&p,&pq0,&pq1,op1,op2,ref_res);
  // //   ext_setSlot(handle,0,1,2,3);
  // //   ext_loadNTTData(handle,op1);
  // //   ext_setSlot(handle,1,0,2,3);
  // //   ext_loadNTTData(handle,op2);
  // //   ext_setSlot(handle,0,1,2,3);
  // //   ext_vectorMultMod(handle,p,pq0,pq1);
  // //   ext_storeNTTData(handle,res);
  // // }
  // // barrett_reduction is similar to eltwisemulmod

  // //barrett reduction
  // if(test == 7) {   
  //   load_barrett(&p,&pq0,&pq1,op1,op2,ref_res1);

  //   ext_setSlot_16_MODULE(handle,2,1,0,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,2,1,0,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_loadNTTData(handle,op1);
    
  //   ext_setSlot_16_MODULE(handle,3,1,2,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,3,1,2,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_loadNTTData(handle,op2);
    
  //   ext_setSlot_16_MODULE(handle,0,1,21,22,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,2,3,23);
  //      ext_setSlot_16_RAM(handle,0,1,21,22,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,2,3,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_vectorBarrestReduction128(handle,0,p,pq0,pq1);
  //   ext_setSlot_16_MODULE(handle,2,1,0,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,2,1,0,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_storeNTTData(handle,res1);
  // }

  // //lazy reduction
  // if(test == 8) {   
  //   load_lazy(op1,op2,op3,op4,ref_res1,ref_res2);

  //   // ext_setSlot(handle,0,1,2,3);
  //   ext_setSlot_16_MODULE(handle,23,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,0);
  //      ext_setSlot_16_RAM(handle,23,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,0
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_loadNTTData(handle,op1);
  //   // ext_setSlot(handle,1,0,2,3);
  //   ext_setSlot_16_MODULE(handle,20,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,0,21,22,23);
  //      ext_setSlot_16_RAM(handle,20,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,0,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_loadNTTData(handle,op2);
  //   // ext_setSlot(handle,2,0,1,3);
  //   ext_setSlot_16_MODULE(handle,12,1,2,3,4,5,6,7,8,9,10,11,0,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,12,1,2,3,4,5,6,7,8,9,10,11,0,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_loadNTTData(handle,op3);
  //   // ext_setSlot(handle,3,0,1,2);
  //   ext_setSlot_16_MODULE(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_loadNTTData(handle,op4);

  //   // ext_setSlot(handle,0,1,2,3);
  //   ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,28,10,11,27,13,14,15,16,17,18,19,26,21,22,25);
  //      ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,24,10,11,24,13,14,15,16,17,18,19,24,21,22,24
  //                               ,24,23,20,12,9,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_vectorLazyReduction(handle,0,p);

  //   ext_setSlot_16_MODULE(handle,23,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,0);
  //      ext_setSlot_16_RAM(handle,23,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,0
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_storeNTTData(handle,res1);

  //   // ext_setSlot(handle,1,0,2,3);
  //   ext_setSlot_16_MODULE(handle,20,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,0,21,22,23);
  //      ext_setSlot_16_RAM(handle,20,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,0,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_storeNTTData(handle,res2);
  // }

  // //decomposition
  // if(test == 9) {   
  //   load_decomp(&p, &pq0, op1, ref_res1);

  //   // ext_setSlot(handle,0,1,2,3);
  //   ext_setSlot_16_MODULE(handle,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,0,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,0,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   printf("laod\n");
  //   ext_loadNTTData(handle,op1);

  //   // ext_setSlot(handle,0,1,2,3);
  //   ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,37,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,37,20,21,22,23
  //                               ,24,25,26,27,28,29,30,31,32,33,34,35,36,19,38,39);
  //   printf("decomp\n");
  //   ext_vectorDecomp(handle,0,p,pq0);
    
  //   printf("store\n");
  //   ext_setSlot_16_MODULE(handle,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,0,20,21,22,23);
  //      ext_setSlot_16_RAM(handle,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,0,20,21,22,23
  //                               ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  //   ext_storeNTTData(handle,res1);
    

  //   // for(int i = 0 ; i < 8192 ; i++)
  //   // {
  //   //   printf("res_1[%d] = %llu\n", i, res1[i]);
  //   // }


  //   // for(int i = 0 ; i < 8192 ; i++)
  //   // {
  //   //   printf("res_2[%d] = %llu\n", i, res2[i]);
  //   // }
    
  //   // ext_setSlot(handle,2,0,1,3);
  //   // ext_storeNTTData(handle,res);
  //   // for(int i = 0 ; i < 8192 ; i++)
  //   // {
  //   //   printf("res[%d] = %llu\n", i, res[i]);
  //   // }

  //   // ext_setSlot(handle,3,0,1,2);
  //   // ext_storeNTTData(handle,res);
  //   // for(int i = 0 ; i < 8192 ; i++)
  //   // {
  //   //   printf("res[%d] = %llu\n", i, res[i]);
  //   // }


  // }

  //auto
  if(test == 10) {   

    for(int i = 0; i < N ; i++){
      op1[i] = i;
      // printf("op1[%d] = %d\n", i,op1[i]);
    }

    int k = 653;
    int auto_base = 3;
    int auto_offset = 0;

    // ext_setSlot(handle,0,1,2,3);
    ext_setSlot_16_MODULE(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
    printf("laod\n");
    ext_loadNTTData(handle,op1);

    // ext_setSlot(handle,0,1,2,3);
    ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,10,8,9,7,11,12,13,14,15,16,17,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,10,8,9,7,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
    printf("auto\n");
    ext_Auto(handle,0,p,k,auto_base,auto_offset);
    
    printf("store\n");
    ext_storeNTTData(handle,op1);

    for(int i = 0; i < N ; i++){
      // printf("%d\n",res1[i]);
    }
  
  }

  //set
  if(test == 11) {   

    for(int i = 0; i < N ; i++){
      op1[i] = i;
      // printf("op1[%d] = %d\n", i,op1[i]);
      ref_res1[i] = i;
    }

    // ext_setSlot(handle,0,1,2,3);
    ext_setSlot_16_MODULE(handle,17,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,0,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,17,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,0,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
    printf("laod\n");
    ext_loadNTTData(handle,op1);

    // ext_setSlot(handle,0,1,2,3);
    ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,35,36,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,35,36,37,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,17,18,37,38,39);
    printf("set\n");
    ext_set_uint(handle,1);  
    
    printf("store\n");
    ext_setSlot_16_MODULE(handle,17,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,0,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,17,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,0,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
    ext_storeNTTData(handle,res1);

    // for(int i = 0; i < N ; i++){
    //   printf("%d\n",res1[i]);
    // }
  
  }

  //sub
  if(test == 12) {   

    for(int i = 0; i < N ; i++){
      op1[i] = i;
      op2[i] = N/2;
      ref_res1[i] = i;
    }
    p = 100000;

    // ext_setSlot(handle,0,1,2,3);
    ext_setSlot_16_MODULE(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
    printf("laod op1\n");
    ext_loadNTTData(handle,op1);

    // ext_setSlot(handle,0,1,2,3);
    ext_setSlot_16_MODULE(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,17,18,37,38,39);
    printf("laod op2\n");
    ext_loadNTTData(handle,op2);

    ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,17,18,37,38,39);

    printf("sub\n");
    ext_vectorSubMod(handle,0,p);  
    
    printf("store\n");
    ext_setSlot_16_MODULE(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
       ext_setSlot_16_RAM(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                                ,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39);
    ext_storeNTTData(handle,res1);

    for(int i = 0; i < N ; i++){
      printf("%d\n",res1[i]);
    }
  
  }

  printf("check vector test %d result start\n", test);    
  for(int i = 0; i < N; i++) {
    if(res1[i] != ref_res1[i])  {
      std::cout << "test " << test << " vector mismatch at:" << i << " got:" <<  res1[i]  << " ref1:" <<  ref_res1[i] << std::endl;
    }
    if(test == 8) {
      if(res1[i] != ref_res1[i])  {
        std::cout << "test " << test << " vector mismatch at:" << i << " got:" <<  res2[i]  << " ref2:" <<  ref_res2[i] << std::endl;
      }
    }
  }
  printf("check vector test %d result finish\n", test);    
  

  printf("test %d finish\n\n", test);

  free(op1);
  free(op2);
  free(op3);
  free(op4);
  free(res1);
  free(res2);
  free(ref_res1);
  free(ref_res2);
}

void Multi_Module_test(void* handle) {
  // ntt base level: 6
  // ntt level: 3
  uint64_t p;
  uint64_t* rootpow1 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* rootpowq1 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* rootpow2 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* rootpowq2 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* ntt_in1 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* ntt_in2 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* ntt_in3 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* ntt_in4 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* ntt_out1 = (uint64_t*)malloc(N*sizeof(uint64_t));
  // intt base level: 1
  // intt level: 3
  uint64_t ip;
  uint64_t* irootpow1 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* irootpowq1 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* irootpow2 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* irootpowq2 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* intt_in1 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* intt_in2 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* intt_in3 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* intt_in4 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* intt_out1 = (uint64_t*)malloc(N*sizeof(uint64_t));
  
  // trans base : 3
  // barrel load/store : 0/0 
  uint64_t* trans_in = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* trans_out = (uint64_t*)malloc(N*sizeof(uint64_t));
  // perm pattern : 8
  uint64_t* perm_in = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* perm_out = (uint64_t*)malloc(N*sizeof(uint64_t));
  // auto base : 8
  // auto offset : 0
  uint64_t ap;
  uint64_t galois_elt;
  uint64_t* auto_in = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* auto_out = (uint64_t*)malloc(N*sizeof(uint64_t));
  
  // load_mod_ntt(&p,rootpow1,rootpowq1,ntt_in1,ntt_out1);
  // load_mod_intt(&ip,irootpow1,irootpowq1,intt_in1,intt_out1);
  // load_mod_auto(&ap,&galois_elt,auto_in,auto_out);
  // load_mod_trans(trans_in,trans_out);
  // load_mod_perm(perm_in,perm_out);

  // for(int i = 0; i < N; i++) {
  //   rootpow1[i] = i;
  //   rootpowq1[i] = i+N;
  //   rootpow2[i] = i+2*N;
  //   rootpowq2[i] = i+3*N;
  //   irootpow1[i] = i;
  //   irootpowq1[i] = i+N;
  //   irootpow2[i] = i+2*N;
  //   irootpowq2[i] = i+3*N;
  //   ntt_in1[i] = i;
  //   ntt_in2[i] = i+N;
  //   intt_in1[i] = i+2*N;
  //   intt_in2[i] = i+3*N;
  // }

  //load
  ext_setSlot_NTT(handle,0,1,2,3);
  ext_setSlot_ROOT(handle,0,1,2,3,0,1,2,3);
  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);

  ext_setSlot_NTT(handle,0,1,2,3);
  ext_setSlot_ROOT(handle,0,1,2,3,0,1,2,3);
  ext_loadRootPows(handle,rootpow1,rootpowq1);
  

  ext_setSlot_NTT(handle,2,1,0,3);
  ext_setSlot_ROOT(handle,0,1,2,3,0,1,2,3);
  ext_loadRootPows(handle,rootpow1,rootpowq1);

  ext_setSlot_NTT(handle,1,0,2,3);
  ext_setSlot_ROOT(handle,0,1,2,3,0,1,2,3);
  ext_loadIRootPows(handle,irootpow1,irootpowq1);

  ext_setSlot_NTT(handle,3,1,2,0);
  ext_setSlot_ROOT(handle,0,1,2,3,0,1,2,3);
  ext_loadIRootPows(handle,irootpow1,irootpowq1);

  //trans
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_loadNTTData(handle,trans_in);
  //perm
  ext_setSlot_16_MODULE(handle,3,1,2,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,3,1,2,0,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_loadNTTData(handle,perm_in);
  //auto
  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_loadNTTData(handle,auto_in);
  //ntt1
  ext_setSlot_16_MODULE(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_loadNTTData(handle,ntt_in1);
  //ntt2
  ext_setSlot_16_MODULE(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_loadNTTData(handle,ntt_in1);
  //ntt3
  ext_setSlot_16_MODULE(handle,11,1,2,3,4,5,6,7,8,9,10,0,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,11,1,2,3,4,5,6,7,8,9,10,0,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_loadNTTData(handle,ntt_in1);
  //ntt4
  ext_setSlot_16_MODULE(handle,12,1,2,3,4,5,6,7,8,9,10,11,0,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,12,1,2,3,4,5,6,7,8,9,10,11,0,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_loadNTTData(handle,ntt_in1);
  //intt1
  ext_setSlot_16_MODULE(handle,12,1,2,3,4,5,6,7,8,9,10,11,12,0,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,12,1,2,3,4,5,6,7,8,9,10,11,12,0,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_loadNTTData(handle,intt_in1);
  //intt2
  ext_setSlot_16_MODULE(handle,14,1,2,3,4,5,6,7,8,9,10,11,12,13,0,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,14,1,2,3,4,5,6,7,8,9,10,11,12,13,0,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_loadNTTData(handle,intt_in1);
  //intt3
  ext_setSlot_16_MODULE(handle,15,1,2,3,4,5,6,7,8,9,10,11,12,13,14,0,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,15,1,2,3,4,5,6,7,8,9,10,11,12,13,14,0,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_loadNTTData(handle,intt_in1);
  //intt4
  ext_setSlot_16_MODULE(handle,16,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,16,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_loadNTTData(handle,intt_in1);
  

  usleep(10000);

  // ntt, intt => 4 
  // ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
  //    ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
  //                             ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);

  // // ext_setSlot_NTT(handle,0,1,4,5); //ntt1 , ntt2, intt1, intt2
  // // ext_setSlot_ROOT(handle,0,1,0,1,2,3,2,3);
  // ext_setSlot_NTT(handle,0,4,1,5); //ntt1, intt1, ntt2, intt2
  // ext_setSlot_ROOT(handle,0,2,0,1,1,3,2,3);



  // root ntt1 , ntt2, intt1, intt2
  ext_setSlot_16_MODULE(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_setSlot_NTT(handle,0,4,1,5); //ntt1, intt1, ntt2, intt2
  ext_setSlot_ROOT(handle,0,0,0,0,1,1,1,1);


  //root(ntt,intt,ntt,intt)  
  //execute
  
  ext_transposeTest_M(handle,0,3,0,0);
  ext_permPattern_M(handle,0,8);
  ext_Auto_M(handle,0,ap,galois_elt,9,0);
  ext_NTT_multi_for_one_q(handle,3,3,6,p);
  ext_iNTT_multi_for_one_q(handle,3,3,1,ip);
  // ext_NTT_M(handle,0,3,6,p);
  // ext_NTT_M(handle,1,3,6,p);
  // ext_iNTT_M(handle,0,3,1,ip);
  // ext_iNTT(handle,1,3,1,ip);
  ext_Control_WaitforIdle(handle, 0);

  ext_setSlot_NTT(handle,2,6,3,7); // ntt3, intt3, ntt4, intt4
  ext_setSlot_ROOT(handle,0,1,0,2,2,3,1,3);
  ext_NTT_M(handle,2,3,6,p);
  ext_NTT_M(handle,3,3,6,p);
  ext_iNTT_M(handle,2,3,1,ip);
  ext_iNTT(handle,3,3,1,ip);

  // ext_NTT(handle,3,6,p);
  // ext_iNTT(handle,3,1,ip);
  // ext_transposeTest(handle,3,0,0);
  // ext_permPattern(handle,8);
  // ext_Auto(handle,ap,galois_elt,9,0);

  usleep(1000);
  //store
  //trans
  ext_setSlot_16_MODULE(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_storeNTTData(handle,trans_in);
  //perm
  ext_setSlot_16_MODULE(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,4,1,2,3,0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_storeNTTData(handle,perm_in);
  //auto
  ext_setSlot_16_MODULE(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,7,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_storeNTTData(handle,auto_in);
  //ntt1
  ext_setSlot_16_MODULE(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,9,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_storeNTTData(handle,ntt_in1);
  //ntt2
  ext_setSlot_16_MODULE(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,10,1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_storeNTTData(handle,ntt_in2);
  //ntt3
  ext_setSlot_16_MODULE(handle,11,1,2,3,4,5,6,7,8,9,10,0,12,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,11,1,2,3,4,5,6,7,8,9,10,0,12,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_storeNTTData(handle,ntt_in3);
  //ntt4
  ext_setSlot_16_MODULE(handle,12,1,2,3,4,5,6,7,8,9,10,11,0,13,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,12,1,2,3,4,5,6,7,8,9,10,11,0,13,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_storeNTTData(handle,ntt_in4);
  //intt1
  ext_setSlot_16_MODULE(handle,13,1,2,3,4,5,6,7,8,9,10,11,12,0,14,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,13,1,2,3,4,5,6,7,8,9,10,11,12,0,14,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_storeNTTData(handle,intt_in1);
  //intt2
  ext_setSlot_16_MODULE(handle,14,1,2,3,4,5,6,7,8,9,10,11,12,13,0,15,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,14,1,2,3,4,5,6,7,8,9,10,11,12,13,0,15,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_storeNTTData(handle,intt_in2);
  //intt3
  ext_setSlot_16_MODULE(handle,15,1,2,3,4,5,6,7,8,9,10,11,12,13,14,0,16,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,15,1,2,3,4,5,6,7,8,9,10,11,12,13,14,0,16,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_storeNTTData(handle,intt_in3);
  //intt4
  ext_setSlot_16_MODULE(handle,16,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0,17,18,19,20,21,22,23);
     ext_setSlot_16_RAM(handle,16,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0,17,18,19,20,21,22,23
                              ,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24);
  ext_storeNTTData(handle,intt_in4);


  //comp
  printf("diff trans\n");
  for(int i = 0; i < N; i++) {
    if(trans_in[i] != trans_out[i]) {
      std::cout << "trans_result mismatch " << i << " " <<  trans_in[i]  << " " <<  trans_out[i]  << std::endl;
      // break;
    }
  }

  printf("diff perm\n");
  for(int i = 0; i < N; i++) {
    if(perm_in[i] != perm_out[i]) {
      std::cout << "perm_result mismatch " << i << " " <<  perm_in[i]  << " " <<  perm_out[i]  << std::endl;
      // break;
    }
  }

  printf("diff auto\n");
  for(int i = 0; i < N; i++) {
    if(auto_in[i] != auto_out[i]) {
      std::cout << "auto_result mismatch " << i << " " <<  auto_in[i]  << " " <<  auto_out[i]  << std::endl;
      // break;
    }
  }

  printf("diff ntt1\n");
  for(int i = 0; i < N; i++) {
    if(ntt_in1[i] != ntt_out1[i]) {
      std::cout << "ntt_result mismatch1 " << i << " " <<  ntt_in1[i]  << " " <<  ntt_out1[i]  << std::endl;
      // break;
    }
  }
  printf("diff ntt2\n");
  for(int i = 0; i < N; i++) {
    if(ntt_in2[i] != ntt_out1[i]) {
      std::cout << "ntt_result mismatch2 " << i << " " <<  ntt_in2[i]  << " " <<  ntt_out1[i]  << std::endl;
      // break;
    }
  }
  printf("diff ntt3\n");
  for(int i = 0; i < N; i++) {
    if(ntt_in3[i] != ntt_out1[i]) {
      std::cout << "ntt_result mismatch3 " << i << " " <<  ntt_in3[i]  << " " <<  ntt_out1[i]  << std::endl;
      // break;
    }
  }
  printf("diff ntt4\n");
  for(int i = 0; i < N; i++) {
    if(ntt_in4[i] != ntt_out1[i]) {
      std::cout << "ntt_result mismatch4 " << i << " " <<  ntt_in4[i]  << " " <<  ntt_out1[i]  << std::endl;
      // break;
    }
  }

  printf("diff intt1\n");
  for(int i = 0; i < N; i++) {
    if(intt_in1[i] != intt_out1[i]) {
      std::cout << "intt_result mismatch1 " << i << " " <<  intt_in1[i]  << " " <<  intt_out1[i]  << std::endl;
      // break;
    }
  }
  printf("diff intt2\n");
  for(int i = 0; i < N; i++) {
    if(intt_in2[i] != intt_out1[i]) {
      std::cout << "intt_result mismatch2 " << i << " " <<  intt_in2[i]  << " " <<  intt_out1[i]  << std::endl;
      // break;
    }
  }
  printf("diff intt3\n");
  for(int i = 0; i < N; i++) {
    if(intt_in3[i] != intt_out1[i]) {
      std::cout << "intt_result mismatch3 " << i << " " <<  intt_in3[i]  << " " <<  intt_out1[i]  << std::endl;
      // break;
    }
  }
  printf("diff intt4\n");
  for(int i = 0; i < N; i++) {
    if(intt_in4[i] != intt_out1[i]) {
      std::cout << "intt_result mismatch4 " << i << " " <<  intt_in4[i]  << " " <<  intt_out1[i]  << std::endl;
      // break;
    }
  }
  printf("\n");


}

void test_vectors(void* handle) {
  uint64_t* op1 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* op2 = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* res = (uint64_t*)malloc(N*sizeof(uint64_t));
  uint64_t* ref_res = (uint64_t*)malloc(N*sizeof(uint64_t));

  uint64_t p;
  uint64_t pq0;
  uint64_t pq1;
  uint64_t scalar;

  // // okay
  // load_EltwiseAddMod(&p,op1,op2,ref_res);
  // for(int i = 0; i < N; i++) {
  //   res[i] = op1[i] + op2[i];
  //   if(res[i] >= p) res[i] -= p;
  // }

  // // okay
  // load_EltwiseAddMod_scalar(&p,op1,&scalar,ref_res);
  // for(int i = 0; i < N; i++) {
  //   res[i] = op1[i] + scalar;
  //   if(res[i] >= p) res[i] -= p;
  // }

//   // okay
//   load_EltwiseMultMod(&p,&pq0,&pq1,op1,op2,ref_res);
//   for(int i = 0; i < N; i++) {
//   // for(int i = 0; i < 1; i++) {
//     __uint128_t y = (__uint128_t)op1[i] * (__uint128_t)op2[i];

//     uint64_t i0 = y & 0xFFFFFFFFFFFFFFFFULL;
//     uint64_t i1 = y >> 64;

// // 20371152077097062 * 1095296862218943271 = 5845607017041414538 1209560823344929
// // carry 7974741   tmp2[0] 1295991904114874528   tmp2[1] 5   tmp1 1295991904122849269    tmp3 5
// // carry 1650   tmp2[0] 2157428402038038272   tmp2[1] 1650  tmp1 3453420306160887541    
// // tmp1 19352973173520519    
// // tmp3 215838769297248515    
// // tmp3 215838769297248515    

//     printf("%lu * %lu = %lu %lu\n",op1[i],op2[i],i0,i1);



//     // Multiply input and const_ratio
//     // Round 1
//           // multiply_uint64_hw64(input[0], const_ratio[0], &carry);

//           // multiply_uint64(input[0], const_ratio[1], tmp2);
//           // tmp3 = tmp2[1] + add_uint64(tmp2[0], carry, &tmp1);
//     uint64_t carry = ((__uint128_t)i0*(__uint128_t)pq0) >> 64;
//     __uint128_t tmp2 = (__uint128_t)i0*(__uint128_t)pq1;
//     __uint128_t tmp1 = (tmp2 & 0xFFFFFFFFFFFFFFFFULL) + carry;
//     uint64_t tmp3 = (tmp2 >> 64) + ((tmp1 >> 64) ? 1:0);

//     printf("carry %lu   tmp2[0] %lu   tmp2[1] %lu   tmp1 %lu    tmp3 %lu\n",carry,(uint64_t)(tmp2 & 0xFFFFFFFFFFFFFFFFULL),(uint64_t)(tmp2 >> 64),(uint64_t)tmp1,tmp3);

//     // Round 2
//             // multiply_uint64(input[1], const_ratio[0], tmp2);
//             // carry = tmp2[1] + add_uint64(tmp1, tmp2[0], &tmp1);
//     tmp2 = (__uint128_t)i1 * (__uint128_t)pq0;
//     tmp1 = (tmp1 & 0xFFFFFFFFFFFFFFFFULL) + (tmp2 & 0xFFFFFFFFFFFFFFFFULL);
//     carry =  (tmp2 >> 64) + ((tmp1 >> 64) ? 1:0);

//     printf("carry %lu   tmp2[0] %lu   tmp2[1] %lu  tmp1 %lu    \n",carry,(uint64_t)(tmp2 & 0xFFFFFFFFFFFFFFFFULL),(uint64_t)(tmp2 >> 64),(uint64_t)tmp1);

//     // This is all we care about
//             // tmp1 = input[1] * const_ratio[1] + tmp3 + carry;
//     tmp1 = i1 * pq1  + tmp3 + carry;

//     printf("tmp1 %lu    \n",(uint64_t)tmp1);

//     // Barrett subtraction
//             // tmp3 = input[0] - tmp1 * modulus.value();
//     res[i] = i0 - (tmp1 & 0xFFFFFFFFFFFFFFFFULL) * p;

//     printf("tmp3 %lu    \n",res[i]);

//     // One more subtraction is enough
//     if(res[i] >= p) res[i] -= p;

//     printf("tmp3 %lu    \n",res[i]);
//   }

  // // okay
  // load_EltwiseReduceMod(&p,&pq0,&pq1,op1,ref_res);
  // for(int i = 0; i < N; i++) {    
  //           // // Reduces input using base 2^64 Barrett reduction
  //           // // floor(2^64 / mod) == floor( floor(2^128 / mod) )
  //           // unsigned long long tmp[2];
  //           // const std::uint64_t *const_ratio = modulus.const_ratio().data();
  //           // multiply_uint64_hw64(input, const_ratio[1], tmp + 1);

  //           // // Barrett subtraction
  //           // tmp[0] = input - tmp[1] * modulus.value();

  //           // // One more subtraction is enough
  //           // return SEAL_COND_SELECT(tmp[0] >= modulus.value(), tmp[0] - modulus.value(), tmp[0]);

  //   uint64_t y = op1[i];
  //   uint64_t tmp1 = (y * (__uint128_t)pq1) >> 64 ;
  //   res[i] = y - tmp1 * p;
  //   if(res[i] >= p) res[i] -= p;
  // }

  
  // // okay
  // load_res_multiply_poly_scalar_coeffmod(&p,&pq0,&pq1,op1,&scalar,ref_res);
  // for(int i = 0; i < N; i++) {
  //   __uint128_t y = (__uint128_t)op1[i] * (__uint128_t)scalar;

  //   uint64_t i0 = y & 0xFFFFFFFFFFFFFFFFULL;
  //   uint64_t i1 = y >> 64;

  //   // Round 1
  //         // multiply_uint64_hw64(input[0], const_ratio[0], &carry);

  //         // multiply_uint64(input[0], const_ratio[1], tmp2);
  //         // tmp3 = tmp2[1] + add_uint64(tmp2[0], carry, &tmp1);
  //   uint64_t carry = ((__uint128_t)i0*(__uint128_t)pq0) >> 64;
  //   __uint128_t tmp2 = (__uint128_t)i0*(__uint128_t)pq1;
  //   __uint128_t tmp1 = (tmp2 & 0xFFFFFFFFFFFFFFFFULL) + carry;
  //   uint64_t tmp3 = (tmp2 >> 64) + ((tmp1 >> 64) ? 1:0);

  //   // Round 2
  //           // multiply_uint64(input[1], const_ratio[0], tmp2);
  //           // carry = tmp2[1] + add_uint64(tmp1, tmp2[0], &tmp1);
  //   tmp2 = (__uint128_t)i1 * (__uint128_t)pq0;
  //   tmp1 = (tmp1 & 0xFFFFFFFFFFFFFFFFULL) + (tmp2 & 0xFFFFFFFFFFFFFFFFULL);
  //   carry =  (tmp2 >> 64) + ((tmp1 >> 64) ? 1:0);

  //   // This is all we care about
  //           // tmp1 = input[1] * const_ratio[1] + tmp3 + carry;
  //   tmp1 = i1 * pq1  + tmp3 + carry;

  //   // printf("tmp1 %lu    \n",(uint64_t)tmp1);

  //   // Barrett subtraction
  //           // tmp3 = input[0] - tmp1 * modulus.value();
  //   res[i] = i0 - (tmp1 & 0xFFFFFFFFFFFFFFFFULL) * p;

  //   // One more subtraction is enough
  //   if(res[i] >= p) res[i] -= p;
  // }


  // // okay
  // load_reduce_2p(&p,op1,ref_res);
  // for(int i = 0; i < N; i++) {    
  //   res[i] =op1[i];
  //   if(res[i] >= p) res[i] -= p;
  // }

  // // okay
  // load_reduce_4p(&p,op1,ref_res);
  // for(int i = 0; i < N; i++) {    
  //   res[i] =op1[i];
  //   if(res[i] >= 2*p) res[i] -= 2*p;
  //   if(res[i] >= p) res[i] -= p;
  // }

  for(int i = 0; i < N; i++) {
  // for(int i = 0; i < 1; i++) {
    if(res[i] != ref_res[i])  {
      std::cout << "vector mismatch at:" << i << " got:" <<  res[i]  << " ref:" <<  ref_res[i] << std::endl;
    }
  }

  free(op1);
  free(op2);
  free(res);
  free(ref_res);
}


int main(int argc, char** argv, char** env) {
  
  // {
  //   uint64_t x;
  //   uint64_t y;
    
  //   size_t level = 0;
  //   size_t gap = N >> 1;

  //   size_t root_idx = 0;
        
  //   for (level = 0; level < logN; level ++) {
  //     size_t chunks = 1 << level;
  //     size_t gap = 1 << (logN-level-1);
  //     size_t offset = 0;

  //     size_t root_base = 1 << level;

  //     for (size_t i = 0; i < chunks; i++)  {
  //       root_idx = root_base + i;

  //       offset = gap * i * 2;
  //       for (size_t j = 0; j < gap; j++)
  //       {
  //         x = offset + j;
  //         y = offset + gap + j;

  //         printf("level:%d chunk:%d/%d gap:%d/%d offset:%d x:%d y:%d root:%d \n",level,i,chunks,j,gap,offset,x,y,root_idx);
  //       }
  //     }     
  //   }
  // }


  //   __INTT();

  // printf("\n");
  // printf("\n");
  // printf("\n");
  // printf("\n");
  // printf("\n");
  // {
  //   uint64_t x;
  //   uint64_t y;
    
  //   int level = logN-1;

  //   size_t gap = 1;

  //   size_t root_idx = 0;
  //   size_t root_base = 1;
        
  //   for (; level >= 0; level --) {
  //     size_t chunks = 1 << level;
  //     size_t gap = 1 << (logN-level-1);
  //     size_t offset = 0;

      

  //     for (size_t i = 0; i < chunks; i++)  {
  //       root_idx = root_base + i;

  //       offset = gap * i * 2;
  //       for (size_t j = 0; j < gap; j++)
  //       {
  //         x = offset + j;
  //         y = offset + gap + j;

  //         printf("level:%d chunk:%lu/%lu gap:%lu/%lu offset:%lu x:%lu y:%lu root:%lu \n",level,i,chunks,j,gap,offset,x,y,root_idx);
  //       }
  //     }     

  //     root_base += 1 << level;
  //   }
  // }
  // printf("\n");
  // printf("\n");
  // printf("\n");
  // printf("\n");
  // printf("\n");
  // exit(0);




  Verilated::commandArgs(argc, argv);



  

  
  void* handle;
  handle = init_verilator();


  // reference_NTT(p,scaledRootPows,scaledRootPowsQ,NTT_data);
  
  // for(int i = 0; i < N; i++) {
  //   if(NTT_data[i] != NTT_result[i])  {
  //     std::cout << "ntt mismatch at:" << i << " got:" <<  NTT_data[i]  << " ref:" <<  NTT_result[i] << std::endl;
  //   }
  // }
  
  // for(int i = 0; i < N; i++) {
  //   NTT_data[i] = i;
  // }
  // for(int i = 0; i < N; i++) {
  //   scaledRootPows[i] = i;
  // }

  ext_Control_Reset(handle);

  usleep(10000);

  
  NTT_sequence(handle);
  ext_Control_Reset(handle);
  // iNTT_sequence(handle);
  // ext_Control_Reset(handle);
  // Auto_sequence(handle);

  // N^16
  // NTT_sequence_logN_16(handle);
  // ext_Control_Reset(handle);
  // iNTT_sequence_logN_16(handle);
  // ext_Control_Reset(handle);
  // Auto_sequence_logN_16(handle);

  // ext_Control_Reset(handle);
  // Multi_Module_test(handle);

  // // test_vectors(handle);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,0);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,1);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,2);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,3);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,4);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,5);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,6);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,7);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,8);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,9);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,10);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,11);
  // ext_Control_Reset(handle);
  // Vector_sequence(handle,12);
  


  // ext_transposeTest(handle,0,0,0,NTT_data);
  // for(unsigned int i = 0; i < N; i++) {
  //   unsigned int tr_i = transpose(i,logN,0,0,0);
  //   if(NTT_data[i] != tr_i) {
  //     std::cout << "result mismatch at:" << i << " got:" <<  NTT_data[i]  << " rev:" <<  tr_i << std::endl;
  //     // break;
  //   }
  // }

  // ext_transposeTest(handle,3,0,0,NTT_data);
  // for(unsigned int i = 0; i < N; i++) {
  //   unsigned int tr_i = transpose(transpose(i,logN,3,0,0),logN,0,0,0);
  //   if(NTT_data[i] != tr_i) {
  //     std::cout << "result mismatch at:" << i << " got:" <<  NTT_data[i]  << " rev:" <<  tr_i << std::endl;
  //     // break;
  //   }
  // }

  // ext_transposeTest(handle,6,0,0,NTT_data);
  // for(unsigned int i = 0; i < N; i++) {
  //   unsigned int tr_i =  transpose(transpose(transpose(i,logN,6,0,0),logN,3,0,0),logN,0,0,0);
  //   if(NTT_data[i] != tr_i) {
  //     std::cout << "result mismatch at:" << i << " got:" <<  NTT_data[i]  << " rev:" <<  tr_i << std::endl;
  //     // break;
  //   }
  // }


  // // ext_transposeTest(handle,1,0,2,NTT_data);
  // ext_transposeTest(handle,7,0,2,NTT_data);
  // for(unsigned int i = 0; i < N; i++) {
  //   // unsigned int tr_i =  transpose(i,logN,1,0,2);
  //   // unsigned int tr_i =  transpose(i,logN,7,0,2);
  //   unsigned int tr_i =  transpose(transpose(transpose( transpose(i,logN,7,0,2),logN,6,0,0),logN,3,0,0),logN,0,0,0);
  //   if(NTT_data[i] != tr_i) {
  //     std::cout << "result mismatch at:" << i << " got:" <<  NTT_data[i]  << " rev:" <<  tr_i << std::endl;
  //     // break;
  //   }
  // }

  // ext_transposeTest(handle,0,0,0,NTT_data);
  // for(unsigned int i = 0; i < N; i++) {
  //   unsigned int tr_i =  transpose(transpose(transpose( transpose(transpose(i,logN,0,0,0),logN,7,0,2),logN,6,0,0),logN,3,0,0),logN,0,0,0);
  //   if(NTT_data[i] != tr_i) {
  //     std::cout << "result mismatch at:" << i << " got:" <<  NTT_data[i]  << " rev:" <<  tr_i << std::endl;
  //     // break;
  //   }
  // }

  // ext_permPattern1(handle,NTT_data);
  // for(unsigned int i = 0; i < N; i++) {
  //   if(NTT_data[i] != i) {
  //     std::cout << "result mismatch at:" << i << " got:" <<  NTT_data[i]  << std::endl;
  //     // break;
  //   }
  // }





  // ext_transposeTest(handle,1,0,2,NTT_data);
  // for(unsigned int i = 0; i < N; i++) {
  //   unsigned int tr_i = transpose(i,logN,1,0,2);
  //   if(NTT_data[i] != tr_i) {
  //     std::cout << "result mismatch at:" << i << " got:" <<  NTT_data[i]  << " rev:" <<  tr_i << std::endl;
  //     // break;
  //   }
  // }

  // ext_transposeTest(handle,1,0,0,NTT_data);
  // for(unsigned int i = 0; i < N; i++) {
  //   unsigned int tr_i = transpose(transpose(i,logN,1,0,0),logN,1,0,2);
  //   if(NTT_data[i] != tr_i) {
  //     std::cout << "result mismatch at:" << i << " got:" <<  NTT_data[i]  << " rev:" <<  tr_i << std::endl;
  //     // break;
  //   }
  // }


  // ext_permPattern1(handle,NTT_data);
  // for(unsigned int i = 0; i < N; i++) {
  //   if(NTT_data[i] != i) {
  //     std::cout << "result mismatch at:" << i << " got:" <<  NTT_data[i]  << std::endl;
  //     // break;
  //   }
  // }

  // ext_butter_NTT(handle,p,scaledRootPows,scaledRootPowsQ,NTT_data);

  // load_iNTT_init_values(&p,scaledRootPows,scaledRootPowsQ,NTT_data,NTT_result,&scalar,&scalar_div_p);
  
  // usleep(10000);

  // ext_Control_Reset(handle);

  // usleep(10000);
  
  // ext_butter_iNTT(handle,p,scaledRootPows,scaledRootPowsQ,NTT_data,scalar,scalar_div_p);

  // for(int i = 0; i < N; i++) {
  //   if(NTT_data[i] != NTT_result[i]) {
  //     std::cout << "intt result mismatch " << i << " " <<  NTT_data[i]  << " " <<  NTT_result[i]  << std::endl;
  //     // break;
  //   }
  // }
  
  
  
  ext_Control_Stop(handle);

  deinit_verilator();
}



void load_NTT_init_values(uint64_t *p,uint64_t *root,uint64_t *rootq,uint64_t *value,uint64_t *result) {
  #include "test_inputs/original/example.txt"
}

// void load_iNTT_init_values(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *root,uint64_t *rootq,uint64_t *value,uint64_t *result,uint64_t *scalar,uint64_t *scalar_div_p) {
//   #include "test_inputs/original/example_intt.txt"
// }

// void load_auto(uint64_t *coeff_count_power,uint64_t *modulus_value,uint64_t *galois_elt,uint64_t *auto_op1,uint64_t *auto_result) {
//   #include "test_inputs/original/auto3.txt"
// }

// void load_EltwiseAddMod(uint64_t *p,uint64_t *EltwiseAddMod_op1,uint64_t *EltwiseAddMod_op2,uint64_t *EltwiseAddMod_res) {
//   #include "test_inputs/original/res_EltwiseAddMod"
// }

// void load_NTT_N_16_init_values(uint64_t *p,uint64_t *root,uint64_t *rootq,uint64_t *value,uint64_t *result) {
//   #include "test_inputs/example_16/example.txt"
// }

// void load_iNTT_N_16_init_values(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *root,uint64_t *rootq,uint64_t *value,uint64_t *result,uint64_t *scalar,uint64_t *scalar_div_p) {
//   #include "test_inputs/example_16/example_intt.txt"
// }

// void load_EltwiseAddMod_N_16(uint64_t *p,uint64_t *add_op1,uint64_t *add_op2,uint64_t *add_result) {
//   #include "test_inputs/example_16/res_EltwiseAddMod.txt"
// }

// void load_res_multiply_poly_scalar_coeffmod_N_16(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *mult_scalar_op1,uint64_t* scalar, uint64_t *mult_scalar_result) {
//   #include "test_inputs/example_16/res_multiply_poly_scalar_coeffmod.txt"
// }

// void load_auto_N_16(uint64_t *galois_elt,uint64_t *auto_op1,uint64_t *auto_result) {
//   #include "test_inputs/example_16/auto.txt"
// }

// void load_EltwiseAddMod_scalar(uint64_t *p,uint64_t *EltwiseAddMod_scalar_op,uint64_t *scalar,uint64_t *EltwiseAddMod_scalar_res) {
//   #include "test_inputs/original/res_EltwiseAddMod_scalar"
// }

// void load_EltwiseMultMod(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *EltwiseMultMod_op1,uint64_t *EltwiseMultMod_op2,uint64_t *EltwiseMultMod_res) {
//   #include "test_inputs/original/res_EltwiseMultMod"
// }

// void load_EltwiseReduceMod(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *EltwiseReduceMod,uint64_t *EltwiseReduceMod_result) {
//   #include "test_inputs/original/res_EltwiseReduceMod"
// }

// void load_res_multiply_poly_scalar_coeffmod(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *multiply_poly_scalar_coeffmod,uint64_t* scalar, uint64_t *multiply_poly_scalar_coeffmod_res) {
//   #include "test_inputs/original/res_multiply_poly_scalar_coeffmod"
// }

// void load_reduce_2p(uint64_t *p,uint64_t *reduce_2p,uint64_t* reduce_2p_res) {
//   #include "test_inputs/original/res_reduce_2p"
// }
// void load_reduce_4p(uint64_t *p,uint64_t *reduce_4p,uint64_t* reduce_4p_res) {
//   #include "test_inputs/original/res_reduce_4p"
// }

// void load_barrett(uint64_t *p,uint64_t *pq0,uint64_t *pq1,uint64_t *barrett_reduction_128_op1,uint64_t *barrett_reduction_128_op2,uint64_t *barrett_reduction_128_res) {
//   #include "test_inputs/original/barrett4.txt"
// }

// void load_lazy(uint64_t *wide_innerresult_0,uint64_t *wide_innerresult_1,uint64_t *key,uint64_t *temp_decomp_coeff,uint64_t *wide_innerresult_0_res,uint64_t *wide_innerresult_1_res) {
//   #include "test_inputs/original/lazy_reduction3.txt"
// }

// void load_decomp(uint64_t *shift,uint64_t *decomposition_bit_count,uint64_t *encrypted_coeff_input,uint64_t *decomp_encrypted_result) {
//   #include "test_inputs/original/decomp2.txt"
// }

// void load_mod_ntt(uint64_t *p,uint64_t *rootpow,uint64_t *rootpowq,uint64_t *ntt_in,uint64_t *ntt_out) {
//   #include "test_inputs/original/mod_ntt2.txt"
// }

// void load_mod_intt(uint64_t *p,uint64_t *rootpow,uint64_t *rootpowq,uint64_t *intt_in,uint64_t *intt_out) {
//   #include "test_inputs/original/mod_intt2.txt"
// }

// void load_mod_auto(uint64_t *p,uint64_t *galois_elt,uint64_t *auto_in,uint64_t *auto_out) {
//   #include "test_inputs/original/mod_auto2.txt"
// }

// void load_mod_trans(uint64_t *trans_in,uint64_t *trans_out) {
//   #include "test_inputs/original/mod_trans.txt"
// }

// void load_mod_perm(uint64_t *perm_in,uint64_t *perm_out) {
//   #include "test_inputs/original/mod_perm.txt"
// }