VERILATOR_FLAGS =
VERILATOR_FLAGS += -cc --exe --build
VERILATOR_FLAGS += -O2 -x-assign 0
VERILATOR_FLAGS += --trace --trace-structs
VERILATOR_FLAGS += --top-module fhe_alu_top
VERILATOR_FLAGS += --threads 1
VERILATOR_FLAGS += -Wno-CMPCONST
VERILATOR_FLAGS += -Wno-WIDTH
VERILATOR_FLAGS += -LDFLAGS -lgmpxx  -LDFLAGS -lpthread 
VERILATOR_FLAGS += -LDFLAGS -lgmp 
VERILATOR_FLAGS += -CFLAGS -g
VERILATOR_FLAGS += -j 12

VERILATOR_ROOT = /usr/local
# VERILATOR_ROOT = /home/hcho/fhe/verilator

CXX=g++
#CXXFLAGS=-std=c++14 -g #-DVM_TRACE=1 -DVL_THREADED #-DVM_COVERAGE=0 -DVM_SC=0 -DVM_TRACE=1 -DVM_TRACE_FST=0 -faligned-new -DVL_THREADED -std=gnu++14 -Os
# CXXFLAGS=-DVM_COVERAGE=0 -DVM_SC=0 -DVM_TRACE=1 -DVM_TRACE_FST=0 -faligned-new -Wno-bool-operation -Wno-sign-compare -Wno-uninitialized -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable -Wno-shadow     -g  -DVL_THREADED -std=gnu++14 -Os 
CXXFLAGS=-g  -DVL_THREADED -std=gnu++14 -Os 

LINKFLAGS = -lpthread
OBJS_DIR = obj_dir
RTLS_DIR = rtl
INC_PARAMS =  -I.  -MMD -I/usr/local/share/verilator/include/ -I/usr/local/share/verilator/include/vltstd -I$(OBJS_DIR)

TOP_MODULE=fhe_alu_top
output_name=$(OBJS_DIR)/V${TOP_MODULE}

default: $(output_name)

RTL_FILES = \
	intf.sv \
	buffer_ramt_fsize.sv \
	fhe_alu_top.sv \
	fhe_alu.sv \
	fhe_ntt.sv \
	fhe_ntt2.sv \
	ibutt.sv \
	butt.sv \
	fifo.sv \
	mult.sv \
	bitrev_v2.sv \
	transpose.sv \
	perm_v2.sv \
	set_uint.sv\
	ntt_control_v1.sv \
	intt_control_v1.sv \
	vector_control_add.sv \
	vector_control_multi.sv \
	vector_control_lazy.sv \
	vector_control_decomp.sv \
	vector_op_multiplier.sv \
	vector_op_adder.sv \
	vector_op_sub.sv \
	vector_op_lazy.sv \
	vector_op_decomp.sv \
	auto_v2.sv \
	buffer_ram_write_buffer.sv \
	buffer_interconnect_v6.sv \
	rootpower_interconnect_v2.sv \
	router.sv \
	router_v2.sv \
	module_buff_set.sv \

C_SOURCE_FILES = \
	testbench.cc \
	fhe_alu_testbench.cc \
	fhe_alu_testbench_host.cc \

C_MAIN_FILES = \
	main.cc \

OBJS := $(patsubst %.cc,$(OBJS_DIR)/%.o,$(C_SOURCE_FILES))
OBJS_MAIN := $(patsubst %.cc,$(OBJS_DIR)/%.o,$(C_MAIN_FILES))
_RTL_FILES := $(patsubst %.sv,$(RTLS_DIR)/%.sv,$(RTL_FILES))

-include $(DEPS)

$(OBJS_DIR)/%.o:%.cc $(output_name)__ALL.a
	mkdir -p $(OBJS_DIR)
	$(CXX) $(CXXFLAGS) $(INC_PARAMS)  $< -c -MMD -MP -o $@

$(output_name)_user.a:  $(OBJS) 
	ar rcs $@  $^ 

$(output_name)_part_from_exe.a: $(OBJS_DIR)/verilated.o $(OBJS_DIR)/verilated_dpi.o $(OBJS_DIR)/verilated_vcd_c.o 
	ar rcs $@  $^ 

$(output_name):  $(OBJS_MAIN) $(output_name)_user.a $(output_name)__ALL.a  $(output_name)_part_from_exe.a
	$(CXX) $(CXXFLAGS) $(INC_PARAMS)  $^ -o $@ $(LINKFLAGS)

$(output_name)__ALL.a: $(_RTL_FILES) $(C_SOURCE_FILES) $(C_MAIN_FILES)
	$(VERILATOR_ROOT)/bin/verilator $(VERILATOR_FLAGS) -f input.vc $(RTL_FILES) $(C_SOURCE_FILES) $(C_MAIN_FILES)

run:
	@mkdir -p logs
	time obj_dir/Vfhe_alu_top 

run_trace:
	@mkdir -p logs
	time obj_dir/Vfhe_alu_top +trace

clean:
	-rm -rf obj_dir logs *.log *.dmp *.vpd core
                                                                      
