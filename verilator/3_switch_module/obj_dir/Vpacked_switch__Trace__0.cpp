// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vpacked_switch__Syms.h"


void Vpacked_switch___024root__trace_chg_0_sub_0(Vpacked_switch___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void Vpacked_switch___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root__trace_chg_0\n"); );
    // Init
    Vpacked_switch___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vpacked_switch___024root*>(voidSelf);
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vpacked_switch___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void Vpacked_switch___024root__trace_chg_0_sub_0(Vpacked_switch___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root__trace_chg_0_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
        bufp->chgWData(oldp+0,(vlSelf->packed_switch__DOT__i_port),1024);
        bufp->chgWData(oldp+32,(vlSelf->packed_switch__DOT__o_port),1024);
        bufp->chgBit(oldp+64,(vlSelf->packed_switch__DOT__switch_set_reg));
        bufp->chgIData(oldp+65,(vlSelf->packed_switch__DOT__unnamedblk1__DOT__i),32);
    }
    bufp->chgBit(oldp+66,(vlSelf->RST_N));
    bufp->chgBit(oldp+67,(vlSelf->CLK));
    bufp->chgBit(oldp+68,(vlSelf->SWITCH_SET));
    bufp->chgWData(oldp+69,(vlSelf->I_PORT),1024);
    bufp->chgWData(oldp+101,(vlSelf->O_PORT),1024);
}

void Vpacked_switch___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root__trace_cleanup\n"); );
    // Init
    Vpacked_switch___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vpacked_switch___024root*>(voidSelf);
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
}
