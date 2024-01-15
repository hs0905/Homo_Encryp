// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vpacked_switch__Syms.h"


VL_ATTR_COLD void Vpacked_switch___024root__trace_init_sub__TOP__0(Vpacked_switch___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+67,0,"RST_N",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+68,0,"CLK",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+69,0,"SWITCH_SET",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+70,0,"I_PORT",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1023,0);
    tracep->declArray(c+102,0,"O_PORT",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1023,0);
    tracep->pushPrefix("packed_switch", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+134,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBit(c+67,0,"RST_N",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+68,0,"CLK",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+69,0,"SWITCH_SET",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+70,0,"I_PORT",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1023,0);
    tracep->declArray(c+102,0,"O_PORT",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1023,0);
    tracep->declArray(c+1,0,"i_port",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1023,0);
    tracep->declArray(c+33,0,"o_port",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1023,0);
    tracep->declBit(c+65,0,"switch_set_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("unnamedblk1", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+66,0,"i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INT, false,-1, 31,0);
    tracep->popPrefix();
    tracep->popPrefix();
}

VL_ATTR_COLD void Vpacked_switch___024root__trace_init_top(Vpacked_switch___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root__trace_init_top\n"); );
    // Body
    Vpacked_switch___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void Vpacked_switch___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
VL_ATTR_COLD void Vpacked_switch___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vpacked_switch___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vpacked_switch___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void Vpacked_switch___024root__trace_register(Vpacked_switch___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root__trace_register\n"); );
    // Body
    tracep->addConstCb(&Vpacked_switch___024root__trace_const_0, 0U, vlSelf);
    tracep->addFullCb(&Vpacked_switch___024root__trace_full_0, 0U, vlSelf);
    tracep->addChgCb(&Vpacked_switch___024root__trace_chg_0, 0U, vlSelf);
    tracep->addCleanupCb(&Vpacked_switch___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void Vpacked_switch___024root__trace_const_0_sub_0(Vpacked_switch___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void Vpacked_switch___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root__trace_const_0\n"); );
    // Init
    Vpacked_switch___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vpacked_switch___024root*>(voidSelf);
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    Vpacked_switch___024root__trace_const_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vpacked_switch___024root__trace_const_0_sub_0(Vpacked_switch___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root__trace_const_0_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullIData(oldp+134,(0x200U),32);
}

VL_ATTR_COLD void Vpacked_switch___024root__trace_full_0_sub_0(Vpacked_switch___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void Vpacked_switch___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root__trace_full_0\n"); );
    // Init
    Vpacked_switch___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vpacked_switch___024root*>(voidSelf);
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    Vpacked_switch___024root__trace_full_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vpacked_switch___024root__trace_full_0_sub_0(Vpacked_switch___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpacked_switch___024root__trace_full_0_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullWData(oldp+1,(vlSelf->packed_switch__DOT__i_port),1024);
    bufp->fullWData(oldp+33,(vlSelf->packed_switch__DOT__o_port),1024);
    bufp->fullBit(oldp+65,(vlSelf->packed_switch__DOT__switch_set_reg));
    bufp->fullIData(oldp+66,(vlSelf->packed_switch__DOT__unnamedblk1__DOT__i),32);
    bufp->fullBit(oldp+67,(vlSelf->RST_N));
    bufp->fullBit(oldp+68,(vlSelf->CLK));
    bufp->fullBit(oldp+69,(vlSelf->SWITCH_SET));
    bufp->fullWData(oldp+70,(vlSelf->I_PORT),1024);
    bufp->fullWData(oldp+102,(vlSelf->O_PORT),1024);
}
