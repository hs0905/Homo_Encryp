# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# IP: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.srcs/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/XDMA_AXI_BENES_xdma_0_1.xci
# IP: The module: 'XDMA_AXI_BENES_xdma_0_1' is the root of the design. Do not add the DONT_TOUCH constraint.

# IP: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip || ORIG_REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip} -quiet] -quiet

# IP: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/ip_0/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt || ORIG_REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt} -quiet] -quiet

# IP: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_1/xdma_v4_1_10_blk_mem_64_reg_be.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==xdma_v4_1_10_blk_mem_64_reg_be || ORIG_REF_NAME==xdma_v4_1_10_blk_mem_64_reg_be} -quiet] -quiet

# IP: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_2/xdma_v4_1_10_blk_mem_64_noreg_be.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==xdma_v4_1_10_blk_mem_64_noreg_be || ORIG_REF_NAME==xdma_v4_1_10_blk_mem_64_noreg_be} -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/ip_0/synth/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt_ooc.xdc

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/ip_0/synth/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt || ORIG_REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_board.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip || ORIG_REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/synth/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_ooc.xdc

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/synth/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_late.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip || ORIG_REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/source/ip_pcie4_uscale_plus_x1y0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip || ORIG_REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_1/xdma_v4_1_10_blk_mem_64_reg_be_ooc.xdc

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_2/xdma_v4_1_10_blk_mem_64_noreg_be_ooc.xdc

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/XDMA_AXI_BENES_xdma_0_1_board.xdc
# XDC: The top module name and the constraint reference have the same name: 'XDMA_AXI_BENES_xdma_0_1'. Do not add the DONT_TOUCH constraint.
set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/source/XDMA_AXI_BENES_xdma_0_1_pcie4_uscaleplus_ip.xdc
# XDC: The top module name and the constraint reference have the same name: 'XDMA_AXI_BENES_xdma_0_1'. Do not add the DONT_TOUCH constraint.
#dup# set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/synth/XDMA_AXI_BENES_xdma_0_1_ooc.xdc
# XDC: The top module name and the constraint reference have the same name: 'XDMA_AXI_BENES_xdma_0_1'. Do not add the DONT_TOUCH constraint.
#dup# set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet

# IP: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.srcs/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/XDMA_AXI_BENES_xdma_0_1.xci
# IP: The module: 'XDMA_AXI_BENES_xdma_0_1' is the root of the design. Do not add the DONT_TOUCH constraint.

# IP: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip || ORIG_REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip} -quiet] -quiet

# IP: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/ip_0/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt || ORIG_REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt} -quiet] -quiet

# IP: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_1/xdma_v4_1_10_blk_mem_64_reg_be.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==xdma_v4_1_10_blk_mem_64_reg_be || ORIG_REF_NAME==xdma_v4_1_10_blk_mem_64_reg_be} -quiet] -quiet

# IP: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_2/xdma_v4_1_10_blk_mem_64_noreg_be.xci
#dup# set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==xdma_v4_1_10_blk_mem_64_noreg_be || ORIG_REF_NAME==xdma_v4_1_10_blk_mem_64_noreg_be} -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/ip_0/synth/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt_ooc.xdc

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/ip_0/synth/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt || ORIG_REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_gt} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_board.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip || ORIG_REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/synth/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_ooc.xdc

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/synth/XDMA_AXI_BENES_xdma_0_1_pcie4c_ip_late.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip || ORIG_REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_0/source/ip_pcie4_uscale_plus_x1y0.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip || ORIG_REF_NAME==XDMA_AXI_BENES_xdma_0_1_pcie4c_ip} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_1/xdma_v4_1_10_blk_mem_64_reg_be_ooc.xdc

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/ip_2/xdma_v4_1_10_blk_mem_64_noreg_be_ooc.xdc

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/XDMA_AXI_BENES_xdma_0_1_board.xdc
# XDC: The top module name and the constraint reference have the same name: 'XDMA_AXI_BENES_xdma_0_1'. Do not add the DONT_TOUCH constraint.
#dup# set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/source/XDMA_AXI_BENES_xdma_0_1_pcie4_uscaleplus_ip.xdc
# XDC: The top module name and the constraint reference have the same name: 'XDMA_AXI_BENES_xdma_0_1'. Do not add the DONT_TOUCH constraint.
#dup# set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet

# XDC: /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_xdma_0_1/synth/XDMA_AXI_BENES_xdma_0_1_ooc.xdc
# XDC: The top module name and the constraint reference have the same name: 'XDMA_AXI_BENES_xdma_0_1'. Do not add the DONT_TOUCH constraint.
#dup# set_property KEEP_HIERARCHY SOFT [get_cells inst -quiet] -quiet
