#**************************************************************
# This .sdc file is created by Terasic Tool.
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************
create_clock -period "50.000000 MHz" [get_ports CLOCK2_50]
create_clock -period "50.000000 MHz" [get_ports CLOCK3_50]
create_clock -period "50.000000 MHz" [get_ports CLOCK4_50]
create_clock -period "50.000000 MHz" [get_ports CLOCK_50]

create_clock -period "27 MHz"  -name tv_27m [get_ports TD_CLK27]
# AUDIO : 48kHz 384fs 32-bit data
create_clock -period "18.432 MHz" -name clk_audxck [get_ports AUD_XCK]
create_clock -period "1.536 MH" -name clk_audbck [get_ports AUD_BCLK]

# for enhancing USB BlasterII to be reliable, 25MHz
create_clock -name {altera_reserved_tck} -period 40 {altera_reserved_tck}
set_input_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tdi]
set_input_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tms]
set_output_delay -clock altera_reserved_tck 3 [get_ports altera_reserved_tdo]

#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks

create_generated_clock -source [get_pins { u0|pll_0|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk }] \
                       -name clk_dram_ext [get_ports {DRAM_CLK}]

create_generated_clock -source [get_pins { u0|pll_0|altera_pll_i|general[3].gpll~PLL_OUTPUT_COUNTER|divclk }] \
                        -name clk_vga_ext [get_ports {VGA_CLK}]


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty



#**************************************************************
# Set Input Delay
#**************************************************************
set_input_delay -max -clock clk_dram_ext 5.96 [get_ports DRAM_DQ*]
set_input_delay -min -clock clk_dram_ext 2.97 [get_ports DRAM_DQ*]


#shift-window
# Users need to modify the below constrains base on their project (Ux and Path)

set_multicycle_path -from [get_clocks {clk_dram_ext}] \
                    -to [get_clocks { u0|pll_0|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk }] \
                                                  -setup 2
# max  3.6 +0.1  = 3.7
## min -2.4 -0.1  = -2.5
# trace different(CLK and data/commmands) : max 0.05, min -0.06
set_input_delay -max -clock tv_27m_ext 3.75 [get_ports {TD_DATA* TD_HS TD_VS}]
set_input_delay -min -clock tv_27m_ext -2.56 [get_ports {TD_DATA* TD_HS TD_VS}]

#**************************************************************
# Set Output Delay
#**************************************************************

# suppose +- 100 ps skew
# max : Board Delay (Data) - Board Delay (Clock) + tsu (External Device)
# min : Board Delay (Data) - Board Delay (Clock) - th (External Device)
# max 1.5+0.1 =1.6
# min -0.8-0.1 = 0.9
# trace different(CLK and data) : max 0.03, min -0.05
# trace different(CLK and commmands) : max 0.05, min 0
set_output_delay -max -clock clk_dram_ext 1.63  [get_ports {DRAM_DQ* DRAM_*DQM}]
set_output_delay -min -clock clk_dram_ext -0.95 [get_ports {DRAM_DQ* DRAM_*DQM}]
set_output_delay -max -clock clk_dram_ext 1.65  [get_ports {DRAM_ADDR* DRAM_BA* DRAM_RAS_N DRAM_CAS_N DRAM_WE_N DRAM_CKE DRAM_CS_N}]
set_output_delay -min -clock clk_dram_ext -0.9 [get_ports {DRAM_ADDR* DRAM_BA* DRAM_RAS_N DRAM_CAS_N DRAM_WE_N DRAM_CKE DRAM_CS_N}]


# trace different(CLK and data/commmands) : max 0.03, min -0.04
set_output_delay -max -clock clk_vga_ext 0.33 [get_ports {VGA_R* VGA_G* VGA_B* VGA_BLANK}]
set_output_delay -min -clock clk_vga_ext -1.64 [get_ports {VGA_R* VGA_G* VGA_B* VGA_BLANK}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

# Asynchronous I/O
set_false_path -from [get_ports {KEY*}] -to *
set_false_path -from [get_ports {SW*} ] -to *
set_false_path -from * -to [get_ports {LEDR*}]



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************



