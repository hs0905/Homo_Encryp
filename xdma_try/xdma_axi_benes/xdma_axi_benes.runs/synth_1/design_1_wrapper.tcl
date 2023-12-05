# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.runs/synth_1/design_1_wrapper.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
set_param power.enableLutRouteBelPower 1
set_param power.enableCarry8RouteBelPower 1
set_param power.enableUnconnectedCarry8PinPower 1
set_param chipscope.maxJobs 6
set_param synth.incrementalSynthesisCache ./.Xil/Vivado-16557-baldur/incrSyn
set_param power.BramSDPPropagationFix 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xcu280-fsvh2892-2L-e

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.cache/wt [current_project]
set_property parent.project_path /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:au280:part0:1.1 [current_project]
set_property ip_repo_paths /home/hs/Desktop/benes_axi/new_benes_with_32 [current_project]
update_ip_catalog
set_property ip_output_repo /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_verilog -library xil_defaultlib /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
add_files /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.srcs/sources_1/bd/design_1/design_1.bd
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/ip_0/synth/design_1_xdma_0_0_pcie4c_ip_gt_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/ip_0/synth/design_1_xdma_0_0_pcie4c_ip_gt.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/design_1_xdma_0_0_pcie4c_ip_board.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/synth/design_1_xdma_0_0_pcie4c_ip_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/synth/design_1_xdma_0_0_pcie4c_ip_late.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_0/source/ip_pcie4_uscale_plus_x1y0.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_1/xdma_v4_1_10_blk_mem_64_reg_be_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/ip_2/xdma_v4_1_10_blk_mem_64_noreg_be_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/design_1_xdma_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/source/design_1_xdma_0_0_pcie4_uscaleplus_ip.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_xdma_0_0/synth/design_1_xdma_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_2/design_1_clk_wiz_2_board.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_2/design_1_clk_wiz_2.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_2/design_1_clk_wiz_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_1_1/design_1_clk_wiz_1_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_1_1/design_1_clk_wiz_1_1.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_1_1/design_1_clk_wiz_1_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.gen/sources_1/bd/design_1/design_1_ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.srcs/constrs_1/new/alveo_u280_fhe.xdc
set_property used_in_implementation false [get_files /home/hs/Desktop/xdma_axi_benes/xdma_axi_benes.srcs/constrs_1/new/alveo_u280_fhe.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top design_1_wrapper -part xcu280-fsvh2892-2L-e
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef design_1_wrapper.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file design_1_wrapper_utilization_synth.rpt -pb design_1_wrapper_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
