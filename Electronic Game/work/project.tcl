set projDir "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/vivado"
set projName "DeezNotes"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/au_top_0.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/multi_seven_seg_1.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/game_Beta_2.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/reset_conditioner_3.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/edge_detector_4.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/button_conditioner_5.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/multi_dec_ctr_6.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/counter_7.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/seven_seg_8.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/decoder_9.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/game_CU_v2_10.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/game_regfile_v2_11.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/alu16_12.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/level_generator_13.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/pipeline_14.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/decimal_counter_15.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/adder16_16.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/boolean16_17.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/shifter16_18.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/comparator16_19.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/led_rom_20.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/clocked_address_21.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/multiplier16_22.v" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/verilog/counter_23.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/constraint/alchitry.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" "C:/Users/Elisabeth/Downloads/DeezNotes/DeezNotes/DeezNotes/work/constraint/io.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 12
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1
