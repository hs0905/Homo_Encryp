// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vpacked_switch.h for the primary calling header

#ifndef VERILATED_VPACKED_SWITCH___024ROOT_H_
#define VERILATED_VPACKED_SWITCH___024ROOT_H_  // guard

#include "verilated.h"


class Vpacked_switch__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vpacked_switch___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(RST_N,0,0);
    VL_IN8(CLK,0,0);
    VL_IN8(SWITCH_SET,0,0);
    CData/*0:0*/ packed_switch__DOT__switch_set_reg;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __Vtrigprevexpr___TOP__CLK__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__RST_N__0;
    CData/*0:0*/ __VactContinue;
    VL_INW(I_PORT,1023,0,32);
    VL_OUTW(O_PORT,1023,0,32);
    VlWide<32>/*1023:0*/ packed_switch__DOT__i_port;
    VlWide<32>/*1023:0*/ packed_switch__DOT__o_port;
    IData/*31:0*/ packed_switch__DOT__unnamedblk1__DOT__i;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<CData/*0:0*/, 2> __Vm_traceActivity;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vpacked_switch__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vpacked_switch___024root(Vpacked_switch__Syms* symsp, const char* v__name);
    ~Vpacked_switch___024root();
    VL_UNCOPYABLE(Vpacked_switch___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
