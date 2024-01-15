// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vpacked_switch.h for the primary calling header

#include "Vpacked_switch__pch.h"
#include "Vpacked_switch__Syms.h"
#include "Vpacked_switch___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vpacked_switch___024root___dump_triggers__stl(Vpacked_switch___024root* vlSelf);
#endif  // VL_DEBUG

VL_ATTR_COLD void Vpacked_switch___024root___eval_triggers__stl(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval_triggers__stl\n"); );
    // Body
    vlSelf->__VstlTriggered.set(0U, (IData)(vlSelf->__VstlFirstIteration));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vpacked_switch___024root___dump_triggers__stl(vlSelf);
    }
#endif
}
