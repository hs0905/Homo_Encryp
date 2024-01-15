// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vpacked_switch.h for the primary calling header

#include "Vpacked_switch__pch.h"
#include "Vpacked_switch___024root.h"

void Vpacked_switch___024root___eval_act(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval_act\n"); );
}

extern const VlWide<32>/*1023:0*/ Vpacked_switch__ConstPool__CONST_hd6b7ba52_0;

VL_INLINE_OPT void Vpacked_switch___024root___nba_sequent__TOP__0(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___nba_sequent__TOP__0\n"); );
    // Body
    if (vlSelf->RST_N) {
        if (vlSelf->packed_switch__DOT__switch_set_reg) {
            vlSelf->packed_switch__DOT__unnamedblk1__DOT__i = 0U;
            while (VL_GTS_III(32, 0x200U, vlSelf->packed_switch__DOT__unnamedblk1__DOT__i)) {
                vlSelf->packed_switch__DOT__o_port[(0x1fU 
                                                    & (((IData)(0x200U) 
                                                        + 
                                                        (0x1ffU 
                                                         & vlSelf->packed_switch__DOT__unnamedblk1__DOT__i)) 
                                                       >> 5U))] 
                    = (((~ ((IData)(1U) << (0x1fU & 
                                            ((IData)(0x200U) 
                                             + (0x1ffU 
                                                & vlSelf->packed_switch__DOT__unnamedblk1__DOT__i))))) 
                        & vlSelf->packed_switch__DOT__o_port[
                        (0x1fU & (((IData)(0x200U) 
                                   + (0x1ffU & vlSelf->packed_switch__DOT__unnamedblk1__DOT__i)) 
                                  >> 5U))]) | ((1U 
                                                & (vlSelf->packed_switch__DOT__i_port[
                                                   (0xfU 
                                                    & (vlSelf->packed_switch__DOT__unnamedblk1__DOT__i 
                                                       >> 5U))] 
                                                   >> 
                                                   (0x1fU 
                                                    & vlSelf->packed_switch__DOT__unnamedblk1__DOT__i))) 
                                               << (0x1fU 
                                                   & ((IData)(0x200U) 
                                                      + 
                                                      (0x1ffU 
                                                       & vlSelf->packed_switch__DOT__unnamedblk1__DOT__i)))));
                vlSelf->packed_switch__DOT__o_port[(0xfU 
                                                    & (vlSelf->packed_switch__DOT__unnamedblk1__DOT__i 
                                                       >> 5U))] 
                    = (((~ ((IData)(1U) << (0x1fU & vlSelf->packed_switch__DOT__unnamedblk1__DOT__i))) 
                        & vlSelf->packed_switch__DOT__o_port[
                        (0xfU & (vlSelf->packed_switch__DOT__unnamedblk1__DOT__i 
                                 >> 5U))]) | ((1U & 
                                               (vlSelf->packed_switch__DOT__i_port[
                                                (0x1fU 
                                                 & (((IData)(0x200U) 
                                                     + 
                                                     (0x1ffU 
                                                      & vlSelf->packed_switch__DOT__unnamedblk1__DOT__i)) 
                                                    >> 5U))] 
                                                >> 
                                                (0x1fU 
                                                 & ((IData)(0x200U) 
                                                    + 
                                                    (0x1ffU 
                                                     & vlSelf->packed_switch__DOT__unnamedblk1__DOT__i))))) 
                                              << (0x1fU 
                                                  & vlSelf->packed_switch__DOT__unnamedblk1__DOT__i)));
                vlSelf->packed_switch__DOT__unnamedblk1__DOT__i 
                    = ((IData)(1U) + vlSelf->packed_switch__DOT__unnamedblk1__DOT__i);
            }
        } else {
            vlSelf->packed_switch__DOT__o_port[0U] 
                = vlSelf->packed_switch__DOT__i_port[0U];
            vlSelf->packed_switch__DOT__o_port[1U] 
                = vlSelf->packed_switch__DOT__i_port[1U];
            vlSelf->packed_switch__DOT__o_port[2U] 
                = vlSelf->packed_switch__DOT__i_port[2U];
            vlSelf->packed_switch__DOT__o_port[3U] 
                = vlSelf->packed_switch__DOT__i_port[3U];
            vlSelf->packed_switch__DOT__o_port[4U] 
                = vlSelf->packed_switch__DOT__i_port[4U];
            vlSelf->packed_switch__DOT__o_port[5U] 
                = vlSelf->packed_switch__DOT__i_port[5U];
            vlSelf->packed_switch__DOT__o_port[6U] 
                = vlSelf->packed_switch__DOT__i_port[6U];
            vlSelf->packed_switch__DOT__o_port[7U] 
                = vlSelf->packed_switch__DOT__i_port[7U];
            vlSelf->packed_switch__DOT__o_port[8U] 
                = vlSelf->packed_switch__DOT__i_port[8U];
            vlSelf->packed_switch__DOT__o_port[9U] 
                = vlSelf->packed_switch__DOT__i_port[9U];
            vlSelf->packed_switch__DOT__o_port[0xaU] 
                = vlSelf->packed_switch__DOT__i_port[0xaU];
            vlSelf->packed_switch__DOT__o_port[0xbU] 
                = vlSelf->packed_switch__DOT__i_port[0xbU];
            vlSelf->packed_switch__DOT__o_port[0xcU] 
                = vlSelf->packed_switch__DOT__i_port[0xcU];
            vlSelf->packed_switch__DOT__o_port[0xdU] 
                = vlSelf->packed_switch__DOT__i_port[0xdU];
            vlSelf->packed_switch__DOT__o_port[0xeU] 
                = vlSelf->packed_switch__DOT__i_port[0xeU];
            vlSelf->packed_switch__DOT__o_port[0xfU] 
                = vlSelf->packed_switch__DOT__i_port[0xfU];
            vlSelf->packed_switch__DOT__o_port[0x10U] 
                = vlSelf->packed_switch__DOT__i_port[0x10U];
            vlSelf->packed_switch__DOT__o_port[0x11U] 
                = vlSelf->packed_switch__DOT__i_port[0x11U];
            vlSelf->packed_switch__DOT__o_port[0x12U] 
                = vlSelf->packed_switch__DOT__i_port[0x12U];
            vlSelf->packed_switch__DOT__o_port[0x13U] 
                = vlSelf->packed_switch__DOT__i_port[0x13U];
            vlSelf->packed_switch__DOT__o_port[0x14U] 
                = vlSelf->packed_switch__DOT__i_port[0x14U];
            vlSelf->packed_switch__DOT__o_port[0x15U] 
                = vlSelf->packed_switch__DOT__i_port[0x15U];
            vlSelf->packed_switch__DOT__o_port[0x16U] 
                = vlSelf->packed_switch__DOT__i_port[0x16U];
            vlSelf->packed_switch__DOT__o_port[0x17U] 
                = vlSelf->packed_switch__DOT__i_port[0x17U];
            vlSelf->packed_switch__DOT__o_port[0x18U] 
                = vlSelf->packed_switch__DOT__i_port[0x18U];
            vlSelf->packed_switch__DOT__o_port[0x19U] 
                = vlSelf->packed_switch__DOT__i_port[0x19U];
            vlSelf->packed_switch__DOT__o_port[0x1aU] 
                = vlSelf->packed_switch__DOT__i_port[0x1aU];
            vlSelf->packed_switch__DOT__o_port[0x1bU] 
                = vlSelf->packed_switch__DOT__i_port[0x1bU];
            vlSelf->packed_switch__DOT__o_port[0x1cU] 
                = vlSelf->packed_switch__DOT__i_port[0x1cU];
            vlSelf->packed_switch__DOT__o_port[0x1dU] 
                = vlSelf->packed_switch__DOT__i_port[0x1dU];
            vlSelf->packed_switch__DOT__o_port[0x1eU] 
                = vlSelf->packed_switch__DOT__i_port[0x1eU];
            vlSelf->packed_switch__DOT__o_port[0x1fU] 
                = vlSelf->packed_switch__DOT__i_port[0x1fU];
        }
        vlSelf->packed_switch__DOT__i_port[0U] = vlSelf->I_PORT[0U];
        vlSelf->packed_switch__DOT__i_port[1U] = vlSelf->I_PORT[1U];
        vlSelf->packed_switch__DOT__i_port[2U] = vlSelf->I_PORT[2U];
        vlSelf->packed_switch__DOT__i_port[3U] = vlSelf->I_PORT[3U];
        vlSelf->packed_switch__DOT__i_port[4U] = vlSelf->I_PORT[4U];
        vlSelf->packed_switch__DOT__i_port[5U] = vlSelf->I_PORT[5U];
        vlSelf->packed_switch__DOT__i_port[6U] = vlSelf->I_PORT[6U];
        vlSelf->packed_switch__DOT__i_port[7U] = vlSelf->I_PORT[7U];
        vlSelf->packed_switch__DOT__i_port[8U] = vlSelf->I_PORT[8U];
        vlSelf->packed_switch__DOT__i_port[9U] = vlSelf->I_PORT[9U];
        vlSelf->packed_switch__DOT__i_port[0xaU] = 
            vlSelf->I_PORT[0xaU];
        vlSelf->packed_switch__DOT__i_port[0xbU] = 
            vlSelf->I_PORT[0xbU];
        vlSelf->packed_switch__DOT__i_port[0xcU] = 
            vlSelf->I_PORT[0xcU];
        vlSelf->packed_switch__DOT__i_port[0xdU] = 
            vlSelf->I_PORT[0xdU];
        vlSelf->packed_switch__DOT__i_port[0xeU] = 
            vlSelf->I_PORT[0xeU];
        vlSelf->packed_switch__DOT__i_port[0xfU] = 
            vlSelf->I_PORT[0xfU];
        vlSelf->packed_switch__DOT__i_port[0x10U] = 
            vlSelf->I_PORT[0x10U];
        vlSelf->packed_switch__DOT__i_port[0x11U] = 
            vlSelf->I_PORT[0x11U];
        vlSelf->packed_switch__DOT__i_port[0x12U] = 
            vlSelf->I_PORT[0x12U];
        vlSelf->packed_switch__DOT__i_port[0x13U] = 
            vlSelf->I_PORT[0x13U];
        vlSelf->packed_switch__DOT__i_port[0x14U] = 
            vlSelf->I_PORT[0x14U];
        vlSelf->packed_switch__DOT__i_port[0x15U] = 
            vlSelf->I_PORT[0x15U];
        vlSelf->packed_switch__DOT__i_port[0x16U] = 
            vlSelf->I_PORT[0x16U];
        vlSelf->packed_switch__DOT__i_port[0x17U] = 
            vlSelf->I_PORT[0x17U];
        vlSelf->packed_switch__DOT__i_port[0x18U] = 
            vlSelf->I_PORT[0x18U];
        vlSelf->packed_switch__DOT__i_port[0x19U] = 
            vlSelf->I_PORT[0x19U];
        vlSelf->packed_switch__DOT__i_port[0x1aU] = 
            vlSelf->I_PORT[0x1aU];
        vlSelf->packed_switch__DOT__i_port[0x1bU] = 
            vlSelf->I_PORT[0x1bU];
        vlSelf->packed_switch__DOT__i_port[0x1cU] = 
            vlSelf->I_PORT[0x1cU];
        vlSelf->packed_switch__DOT__i_port[0x1dU] = 
            vlSelf->I_PORT[0x1dU];
        vlSelf->packed_switch__DOT__i_port[0x1eU] = 
            vlSelf->I_PORT[0x1eU];
        vlSelf->packed_switch__DOT__i_port[0x1fU] = 
            vlSelf->I_PORT[0x1fU];
    } else {
        vlSelf->packed_switch__DOT__o_port[0U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0U];
        vlSelf->packed_switch__DOT__o_port[1U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[1U];
        vlSelf->packed_switch__DOT__o_port[2U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[2U];
        vlSelf->packed_switch__DOT__o_port[3U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[3U];
        vlSelf->packed_switch__DOT__o_port[4U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[4U];
        vlSelf->packed_switch__DOT__o_port[5U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[5U];
        vlSelf->packed_switch__DOT__o_port[6U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[6U];
        vlSelf->packed_switch__DOT__o_port[7U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[7U];
        vlSelf->packed_switch__DOT__o_port[8U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[8U];
        vlSelf->packed_switch__DOT__o_port[9U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[9U];
        vlSelf->packed_switch__DOT__o_port[0xaU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0xaU];
        vlSelf->packed_switch__DOT__o_port[0xbU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0xbU];
        vlSelf->packed_switch__DOT__o_port[0xcU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0xcU];
        vlSelf->packed_switch__DOT__o_port[0xdU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0xdU];
        vlSelf->packed_switch__DOT__o_port[0xeU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0xeU];
        vlSelf->packed_switch__DOT__o_port[0xfU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0xfU];
        vlSelf->packed_switch__DOT__o_port[0x10U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x10U];
        vlSelf->packed_switch__DOT__o_port[0x11U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x11U];
        vlSelf->packed_switch__DOT__o_port[0x12U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x12U];
        vlSelf->packed_switch__DOT__o_port[0x13U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x13U];
        vlSelf->packed_switch__DOT__o_port[0x14U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x14U];
        vlSelf->packed_switch__DOT__o_port[0x15U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x15U];
        vlSelf->packed_switch__DOT__o_port[0x16U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x16U];
        vlSelf->packed_switch__DOT__o_port[0x17U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x17U];
        vlSelf->packed_switch__DOT__o_port[0x18U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x18U];
        vlSelf->packed_switch__DOT__o_port[0x19U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x19U];
        vlSelf->packed_switch__DOT__o_port[0x1aU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x1aU];
        vlSelf->packed_switch__DOT__o_port[0x1bU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x1bU];
        vlSelf->packed_switch__DOT__o_port[0x1cU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x1cU];
        vlSelf->packed_switch__DOT__o_port[0x1dU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x1dU];
        vlSelf->packed_switch__DOT__o_port[0x1eU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x1eU];
        vlSelf->packed_switch__DOT__o_port[0x1fU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x1fU];
        vlSelf->packed_switch__DOT__i_port[0U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0U];
        vlSelf->packed_switch__DOT__i_port[1U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[1U];
        vlSelf->packed_switch__DOT__i_port[2U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[2U];
        vlSelf->packed_switch__DOT__i_port[3U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[3U];
        vlSelf->packed_switch__DOT__i_port[4U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[4U];
        vlSelf->packed_switch__DOT__i_port[5U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[5U];
        vlSelf->packed_switch__DOT__i_port[6U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[6U];
        vlSelf->packed_switch__DOT__i_port[7U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[7U];
        vlSelf->packed_switch__DOT__i_port[8U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[8U];
        vlSelf->packed_switch__DOT__i_port[9U] = Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[9U];
        vlSelf->packed_switch__DOT__i_port[0xaU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0xaU];
        vlSelf->packed_switch__DOT__i_port[0xbU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0xbU];
        vlSelf->packed_switch__DOT__i_port[0xcU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0xcU];
        vlSelf->packed_switch__DOT__i_port[0xdU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0xdU];
        vlSelf->packed_switch__DOT__i_port[0xeU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0xeU];
        vlSelf->packed_switch__DOT__i_port[0xfU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0xfU];
        vlSelf->packed_switch__DOT__i_port[0x10U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x10U];
        vlSelf->packed_switch__DOT__i_port[0x11U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x11U];
        vlSelf->packed_switch__DOT__i_port[0x12U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x12U];
        vlSelf->packed_switch__DOT__i_port[0x13U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x13U];
        vlSelf->packed_switch__DOT__i_port[0x14U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x14U];
        vlSelf->packed_switch__DOT__i_port[0x15U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x15U];
        vlSelf->packed_switch__DOT__i_port[0x16U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x16U];
        vlSelf->packed_switch__DOT__i_port[0x17U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x17U];
        vlSelf->packed_switch__DOT__i_port[0x18U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x18U];
        vlSelf->packed_switch__DOT__i_port[0x19U] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x19U];
        vlSelf->packed_switch__DOT__i_port[0x1aU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x1aU];
        vlSelf->packed_switch__DOT__i_port[0x1bU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x1bU];
        vlSelf->packed_switch__DOT__i_port[0x1cU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x1cU];
        vlSelf->packed_switch__DOT__i_port[0x1dU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x1dU];
        vlSelf->packed_switch__DOT__i_port[0x1eU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x1eU];
        vlSelf->packed_switch__DOT__i_port[0x1fU] = 
            Vpacked_switch__ConstPool__CONST_hd6b7ba52_0[0x1fU];
    }
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
    vlSelf->packed_switch__DOT__switch_set_reg = ((IData)(vlSelf->RST_N) 
                                                  && (IData)(vlSelf->SWITCH_SET));
}

void Vpacked_switch___024root___eval_nba(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval_nba\n"); );
    // Body
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vpacked_switch___024root___nba_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
}

void Vpacked_switch___024root___eval_triggers__act(Vpacked_switch___024root* vlSelf);

bool Vpacked_switch___024root___eval_phase__act(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval_phase__act\n"); );
    // Init
    VlTriggerVec<1> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vpacked_switch___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelf->__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
        vlSelf->__VnbaTriggered.thisOr(vlSelf->__VactTriggered);
        Vpacked_switch___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vpacked_switch___024root___eval_phase__nba(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval_phase__nba\n"); );
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelf->__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vpacked_switch___024root___eval_nba(vlSelf);
        vlSelf->__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vpacked_switch___024root___dump_triggers__nba(Vpacked_switch___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vpacked_switch___024root___dump_triggers__act(Vpacked_switch___024root* vlSelf);
#endif  // VL_DEBUG

void Vpacked_switch___024root___eval(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval\n"); );
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vpacked_switch___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("packed_switch.sv", 3, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                Vpacked_switch___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("packed_switch.sv", 3, "", "Active region did not converge.");
            }
            vlSelf->__VactIterCount = ((IData)(1U) 
                                       + vlSelf->__VactIterCount);
            vlSelf->__VactContinue = 0U;
            if (Vpacked_switch___024root___eval_phase__act(vlSelf)) {
                vlSelf->__VactContinue = 1U;
            }
        }
        if (Vpacked_switch___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vpacked_switch___024root___eval_debug_assertions(Vpacked_switch___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->RST_N & 0xfeU))) {
        Verilated::overWidthError("RST_N");}
    if (VL_UNLIKELY((vlSelf->CLK & 0xfeU))) {
        Verilated::overWidthError("CLK");}
    if (VL_UNLIKELY((vlSelf->SWITCH_SET & 0xfeU))) {
        Verilated::overWidthError("SWITCH_SET");}
}
#endif  // VL_DEBUG
