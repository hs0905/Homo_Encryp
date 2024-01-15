// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vpacked_switch__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

Vpacked_switch::Vpacked_switch(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vpacked_switch__Syms(contextp(), _vcname__, this)}
    , RST_N{vlSymsp->TOP.RST_N}
    , CLK{vlSymsp->TOP.CLK}
    , SWITCH_SET{vlSymsp->TOP.SWITCH_SET}
    , I_PORT{vlSymsp->TOP.I_PORT}
    , O_PORT{vlSymsp->TOP.O_PORT}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vpacked_switch::Vpacked_switch(const char* _vcname__)
    : Vpacked_switch(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vpacked_switch::~Vpacked_switch() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vpacked_switch___024root___eval_debug_assertions(Vpacked_switch___024root* vlSelf);
#endif  // VL_DEBUG
void Vpacked_switch___024root___eval_static(Vpacked_switch___024root* vlSelf);
void Vpacked_switch___024root___eval_initial(Vpacked_switch___024root* vlSelf);
void Vpacked_switch___024root___eval_settle(Vpacked_switch___024root* vlSelf);
void Vpacked_switch___024root___eval(Vpacked_switch___024root* vlSelf);

void Vpacked_switch::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vpacked_switch::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vpacked_switch___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vpacked_switch___024root___eval_static(&(vlSymsp->TOP));
        Vpacked_switch___024root___eval_initial(&(vlSymsp->TOP));
        Vpacked_switch___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vpacked_switch___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vpacked_switch::eventsPending() { return false; }

uint64_t Vpacked_switch::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vpacked_switch::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vpacked_switch___024root___eval_final(Vpacked_switch___024root* vlSelf);

VL_ATTR_COLD void Vpacked_switch::final() {
    Vpacked_switch___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vpacked_switch::hierName() const { return vlSymsp->name(); }
const char* Vpacked_switch::modelName() const { return "Vpacked_switch"; }
unsigned Vpacked_switch::threads() const { return 1; }
void Vpacked_switch::prepareClone() const { contextp()->prepareClone(); }
void Vpacked_switch::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> Vpacked_switch::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vpacked_switch___024root__trace_init_top(Vpacked_switch___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vpacked_switch___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vpacked_switch___024root*>(voidSelf);
    Vpacked_switch__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    Vpacked_switch___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vpacked_switch___024root__trace_register(Vpacked_switch___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vpacked_switch::trace(VerilatedVcdC* tfp, int levels, int options) {
    if (tfp->isOpen()) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vpacked_switch::trace()' shall not be called after 'VerilatedVcdC::open()'.");
    }
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addModel(this);
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vpacked_switch___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}
