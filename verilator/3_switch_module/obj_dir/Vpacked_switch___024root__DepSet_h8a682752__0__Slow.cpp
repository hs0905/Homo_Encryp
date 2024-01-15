// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vpacked_switch.h for the primary calling header

#include "Vpacked_switch__pch.h"
#include "Vpacked_switch___024root.h"

VL_ATTR_COLD void Vpacked_switch___024root___eval_static(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval_static\n"); );
}

VL_ATTR_COLD void Vpacked_switch___024root___eval_initial(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vtrigprevexpr___TOP__CLK__0 = vlSelf->CLK;
    vlSelf->__Vtrigprevexpr___TOP__RST_N__0 = vlSelf->RST_N;
}

VL_ATTR_COLD void Vpacked_switch___024root___eval_final(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval_final\n"); );
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vpacked_switch___024root___dump_triggers__stl(Vpacked_switch___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vpacked_switch___024root___eval_phase__stl(Vpacked_switch___024root* vlSelf);

VL_ATTR_COLD void Vpacked_switch___024root___eval_settle(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval_settle\n"); );
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelf->__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY((0x64U < __VstlIterCount))) {
#ifdef VL_DEBUG
            Vpacked_switch___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("packed_switch.sv", 3, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vpacked_switch___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelf->__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vpacked_switch___024root___dump_triggers__stl(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VstlTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vpacked_switch___024root___stl_sequent__TOP__0(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___stl_sequent__TOP__0\n"); );
    // Body
    vlSelf->O_PORT[0U] = vlSelf->packed_switch__DOT__o_port[0U];
    vlSelf->O_PORT[1U] = vlSelf->packed_switch__DOT__o_port[1U];
    vlSelf->O_PORT[2U] = vlSelf->packed_switch__DOT__o_port[2U];
    vlSelf->O_PORT[3U] = vlSelf->packed_switch__DOT__o_port[3U];
    vlSelf->O_PORT[4U] = vlSelf->packed_switch__DOT__o_port[4U];
    vlSelf->O_PORT[5U] = vlSelf->packed_switch__DOT__o_port[5U];
    vlSelf->O_PORT[6U] = vlSelf->packed_switch__DOT__o_port[6U];
    vlSelf->O_PORT[7U] = vlSelf->packed_switch__DOT__o_port[7U];
    vlSelf->O_PORT[8U] = vlSelf->packed_switch__DOT__o_port[8U];
    vlSelf->O_PORT[9U] = vlSelf->packed_switch__DOT__o_port[9U];
    vlSelf->O_PORT[0xaU] = vlSelf->packed_switch__DOT__o_port[0xaU];
    vlSelf->O_PORT[0xbU] = vlSelf->packed_switch__DOT__o_port[0xbU];
    vlSelf->O_PORT[0xcU] = vlSelf->packed_switch__DOT__o_port[0xcU];
    vlSelf->O_PORT[0xdU] = vlSelf->packed_switch__DOT__o_port[0xdU];
    vlSelf->O_PORT[0xeU] = vlSelf->packed_switch__DOT__o_port[0xeU];
    vlSelf->O_PORT[0xfU] = vlSelf->packed_switch__DOT__o_port[0xfU];
    vlSelf->O_PORT[0x10U] = vlSelf->packed_switch__DOT__o_port[0x10U];
    vlSelf->O_PORT[0x11U] = vlSelf->packed_switch__DOT__o_port[0x11U];
    vlSelf->O_PORT[0x12U] = vlSelf->packed_switch__DOT__o_port[0x12U];
    vlSelf->O_PORT[0x13U] = vlSelf->packed_switch__DOT__o_port[0x13U];
    vlSelf->O_PORT[0x14U] = vlSelf->packed_switch__DOT__o_port[0x14U];
    vlSelf->O_PORT[0x15U] = vlSelf->packed_switch__DOT__o_port[0x15U];
    vlSelf->O_PORT[0x16U] = vlSelf->packed_switch__DOT__o_port[0x16U];
    vlSelf->O_PORT[0x17U] = vlSelf->packed_switch__DOT__o_port[0x17U];
    vlSelf->O_PORT[0x18U] = vlSelf->packed_switch__DOT__o_port[0x18U];
    vlSelf->O_PORT[0x19U] = vlSelf->packed_switch__DOT__o_port[0x19U];
    vlSelf->O_PORT[0x1aU] = vlSelf->packed_switch__DOT__o_port[0x1aU];
    vlSelf->O_PORT[0x1bU] = vlSelf->packed_switch__DOT__o_port[0x1bU];
    vlSelf->O_PORT[0x1cU] = vlSelf->packed_switch__DOT__o_port[0x1cU];
    vlSelf->O_PORT[0x1dU] = vlSelf->packed_switch__DOT__o_port[0x1dU];
    vlSelf->O_PORT[0x1eU] = vlSelf->packed_switch__DOT__o_port[0x1eU];
    vlSelf->O_PORT[0x1fU] = vlSelf->packed_switch__DOT__o_port[0x1fU];
}

VL_ATTR_COLD void Vpacked_switch___024root___eval_stl(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval_stl\n"); );
    // Body
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        Vpacked_switch___024root___stl_sequent__TOP__0(vlSelf);
    }
}

VL_ATTR_COLD void Vpacked_switch___024root___eval_triggers__stl(Vpacked_switch___024root* vlSelf);

VL_ATTR_COLD bool Vpacked_switch___024root___eval_phase__stl(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval_phase__stl\n"); );
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vpacked_switch___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelf->__VstlTriggered.any();
    if (__VstlExecute) {
        Vpacked_switch___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vpacked_switch___024root___dump_triggers__act(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge CLK or negedge RST_N)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vpacked_switch___024root___dump_triggers__nba(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VnbaTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge CLK or negedge RST_N)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vpacked_switch___024root___ctor_var_reset(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->RST_N = VL_RAND_RESET_I(1);
    vlSelf->CLK = VL_RAND_RESET_I(1);
    vlSelf->SWITCH_SET = VL_RAND_RESET_I(1);
    VL_RAND_RESET_W(1024, vlSelf->I_PORT);
    VL_RAND_RESET_W(1024, vlSelf->O_PORT);
    VL_RAND_RESET_W(1024, vlSelf->packed_switch__DOT__i_port);
    VL_RAND_RESET_W(1024, vlSelf->packed_switch__DOT__o_port);
    vlSelf->packed_switch__DOT__switch_set_reg = VL_RAND_RESET_I(1);
    vlSelf->packed_switch__DOT__unnamedblk1__DOT__i = 0;
    vlSelf->__Vtrigprevexpr___TOP__CLK__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__RST_N__0 = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
