set_global_assignment -entity "SPISlave" -library "lib_SPISlave" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "SPISlave" -library "lib_SPISlave" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "SPISlave" -library "lib_SPISlave" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_SPISlave" -name SPD_FILE [file join $::quartus(sip_path) "../SPISlave.spd"]
set_global_assignment -library "lib_SPISlave" -name MISC_FILE [file join $::quartus(sip_path) "../../SPISlave.qsys"]

set_global_assignment -library "lib_SPISlave" -name MISC_FILE [file join $::quartus(sip_path) "SPISlave.v"]
set_global_assignment -library "lib_SPISlave" -name MISC_FILE [file join $::quartus(sip_path) "submodules/spiphyslave.v"]
