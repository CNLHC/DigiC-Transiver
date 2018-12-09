# TCL File Generated by Component Editor 18.0
# Sun Dec 09 09:47:24 GMT+08:00 2018
# DO NOT MODIFY


# 
# QAM_Modulation "QAM_Modulation" v1.0
# CNLHC 2018.12.09.09:47:24
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module QAM_Modulation
# 
set_module_property DESCRIPTION ""
set_module_property NAME QAM_Modulation
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP DigiC
set_module_property AUTHOR CNLHC
set_module_property DISPLAY_NAME QAM_Modulation
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL QAM_Modulation
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE true
add_fileset_file QAM_Modulation.v VERILOG PATH QAM_Modulation.v TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE true
add_fileset_file QAM_Modulation.v VERILOG PATH QAM_Modulation.v


# 
# parameters
# 
add_parameter PACKET_LENGTH INTEGER 1024 ""
set_parameter_property PACKET_LENGTH DEFAULT_VALUE 1024
set_parameter_property PACKET_LENGTH DISPLAY_NAME packet_length
set_parameter_property PACKET_LENGTH WIDTH ""
set_parameter_property PACKET_LENGTH TYPE INTEGER
set_parameter_property PACKET_LENGTH UNITS None
set_parameter_property PACKET_LENGTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property PACKET_LENGTH DESCRIPTION ""
set_parameter_property PACKET_LENGTH HDL_PARAMETER true


# 
# display items
# 


# 
# connection point asi_in0
# 
add_interface asi_in0 avalon_streaming end
set_interface_property asi_in0 associatedClock clock
set_interface_property asi_in0 associatedReset reset
set_interface_property asi_in0 dataBitsPerSymbol 32
set_interface_property asi_in0 errorDescriptor ""
set_interface_property asi_in0 firstSymbolInHighOrderBits true
set_interface_property asi_in0 maxChannel 0
set_interface_property asi_in0 readyLatency 0
set_interface_property asi_in0 ENABLED true
set_interface_property asi_in0 EXPORT_OF ""
set_interface_property asi_in0 PORT_NAME_MAP ""
set_interface_property asi_in0 CMSIS_SVD_VARIABLES ""
set_interface_property asi_in0 SVD_ADDRESS_GROUP ""

add_interface_port asi_in0 asi_in0_data data Input 32
add_interface_port asi_in0 asi_in0_ready ready Output 1
add_interface_port asi_in0 asi_in0_valid valid Input 1
add_interface_port asi_in0 asi_in0_startofpacket startofpacket Input 1
add_interface_port asi_in0 asi_in0_endofpacket endofpacket Input 1
add_interface_port asi_in0 asi_in0_empty empty Input 4


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clock_clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset_reset reset Input 1


# 
# connection point aso_out0
# 
add_interface aso_out0 avalon_streaming start
set_interface_property aso_out0 associatedClock clock
set_interface_property aso_out0 associatedReset reset
set_interface_property aso_out0 dataBitsPerSymbol 17
set_interface_property aso_out0 errorDescriptor ""
set_interface_property aso_out0 firstSymbolInHighOrderBits true
set_interface_property aso_out0 maxChannel 0
set_interface_property aso_out0 readyLatency 0
set_interface_property aso_out0 ENABLED true
set_interface_property aso_out0 EXPORT_OF ""
set_interface_property aso_out0 PORT_NAME_MAP ""
set_interface_property aso_out0 CMSIS_SVD_VARIABLES ""
set_interface_property aso_out0 SVD_ADDRESS_GROUP ""

add_interface_port aso_out0 aso_out0_data data Output 17
add_interface_port aso_out0 aso_out0_ready ready Input 1
add_interface_port aso_out0 aso_out0_valid valid Output 1
add_interface_port aso_out0 aso_out0_empty empty Output 1
add_interface_port aso_out0 aso_out0_endofpacket endofpacket Output 1
add_interface_port aso_out0 aso_out0_startofpacket startofpacket Output 1

