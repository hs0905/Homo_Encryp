#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/tools/Xilinx/Vivado/2020.2/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2020.2/bin
else
  PATH=/tools/Xilinx/Vivado/2020.2/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2020.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/hs/Desktop/FHE/fhe_benes/fhe_interconnect/step1/RTL/sim_resource/novel_benes/novel_benes_bd_maker/novel_benes_bd_maker.runs/design_1_axi_smc_0_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log design_1_axi_smc_0.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source design_1_axi_smc_0.tcl
