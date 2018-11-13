// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// VENDOR "Altera"
// PROGRAM "Quartus Prime"
// VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"

// DATE "11/13/2018 20:36:27"

// 
// Device: Altera 10M50DAF484C6GES Package FBGA484
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module SPISlave (
	stsinkvalid,
	stsinkdata,
	stsinkready,
	stsourceready,
	stsourcevalid,
	stsourcedata,
	sysclk,
	nreset,
	mosi,
	nss,
	miso,
	sclk)/* synthesis synthesis_greybox=0 */;
input 	stsinkvalid;
input 	[7:0] stsinkdata;
output 	stsinkready;
input 	stsourceready;
output 	stsourcevalid;
output 	[7:0] stsourcedata;
input 	sysclk;
input 	nreset;
input 	mosi;
input 	nss;
inout 	miso;
input 	sclk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \spislave_0|SPIPhy_single_output_pipeline_stage|out_valid~q ;
wire \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[0]~q ;
wire \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[1]~q ;
wire \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[2]~q ;
wire \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[3]~q ;
wire \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[4]~q ;
wire \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[5]~q ;
wire \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[6]~q ;
wire \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[7]~q ;
wire \spislave_0|SPIPhy_MISOctl|rdshiftreg[7]~q ;
wire \spislave_0|SPIPhy_altera_avalon_st_idle_inserter|in_ready~3_combout ;
wire \miso~input_o ;
wire \stsinkvalid~input_o ;
wire \stsinkdata[0]~input_o ;
wire \stsinkdata[2]~input_o ;
wire \stsinkdata[1]~input_o ;
wire \stsinkdata[3]~input_o ;
wire \stsinkdata[6]~input_o ;
wire \stsinkdata[4]~input_o ;
wire \stsinkdata[5]~input_o ;
wire \stsinkdata[7]~input_o ;
wire \sysclk~input_o ;
wire \nreset~input_o ;
wire \stsourceready~input_o ;
wire \sclk~input_o ;
wire \mosi~input_o ;
wire \nss~input_o ;


SPISlave_SPIPhy spislave_0(
	.out_valid(\spislave_0|SPIPhy_single_output_pipeline_stage|out_valid~q ),
	.out_data_0(\spislave_0|SPIPhy_single_output_pipeline_stage|out_data[0]~q ),
	.out_data_1(\spislave_0|SPIPhy_single_output_pipeline_stage|out_data[1]~q ),
	.out_data_2(\spislave_0|SPIPhy_single_output_pipeline_stage|out_data[2]~q ),
	.out_data_3(\spislave_0|SPIPhy_single_output_pipeline_stage|out_data[3]~q ),
	.out_data_4(\spislave_0|SPIPhy_single_output_pipeline_stage|out_data[4]~q ),
	.out_data_5(\spislave_0|SPIPhy_single_output_pipeline_stage|out_data[5]~q ),
	.out_data_6(\spislave_0|SPIPhy_single_output_pipeline_stage|out_data[6]~q ),
	.out_data_7(\spislave_0|SPIPhy_single_output_pipeline_stage|out_data[7]~q ),
	.rdshiftreg_7(\spislave_0|SPIPhy_MISOctl|rdshiftreg[7]~q ),
	.in_ready(\spislave_0|SPIPhy_altera_avalon_st_idle_inserter|in_ready~3_combout ),
	.stsinkvalid(\stsinkvalid~input_o ),
	.stsinkdata_0(\stsinkdata[0]~input_o ),
	.stsinkdata_2(\stsinkdata[2]~input_o ),
	.stsinkdata_1(\stsinkdata[1]~input_o ),
	.stsinkdata_3(\stsinkdata[3]~input_o ),
	.stsinkdata_6(\stsinkdata[6]~input_o ),
	.stsinkdata_4(\stsinkdata[4]~input_o ),
	.stsinkdata_5(\stsinkdata[5]~input_o ),
	.stsinkdata_7(\stsinkdata[7]~input_o ),
	.sysclk(\sysclk~input_o ),
	.nss(\nss~input_o ),
	.nreset(\nreset~input_o ),
	.stsourceready(\stsourceready~input_o ),
	.sclk(\sclk~input_o ),
	.mosi(\mosi~input_o ));

assign \stsinkvalid~input_o  = stsinkvalid;

assign \stsinkdata[0]~input_o  = stsinkdata[0];

assign \stsinkdata[2]~input_o  = stsinkdata[2];

assign \stsinkdata[1]~input_o  = stsinkdata[1];

assign \stsinkdata[3]~input_o  = stsinkdata[3];

assign \stsinkdata[6]~input_o  = stsinkdata[6];

assign \stsinkdata[4]~input_o  = stsinkdata[4];

assign \stsinkdata[5]~input_o  = stsinkdata[5];

assign \stsinkdata[7]~input_o  = stsinkdata[7];

assign \sysclk~input_o  = sysclk;

assign \nreset~input_o  = nreset;

assign \stsourceready~input_o  = stsourceready;

assign \sclk~input_o  = sclk;

assign \mosi~input_o  = mosi;

assign stsinkready = \spislave_0|SPIPhy_altera_avalon_st_idle_inserter|in_ready~3_combout ;

assign stsourcevalid = \spislave_0|SPIPhy_single_output_pipeline_stage|out_valid~q ;

assign stsourcedata[0] = \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[0]~q ;

assign stsourcedata[1] = \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[1]~q ;

assign stsourcedata[2] = \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[2]~q ;

assign stsourcedata[3] = \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[3]~q ;

assign stsourcedata[4] = \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[4]~q ;

assign stsourcedata[5] = \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[5]~q ;

assign stsourcedata[6] = \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[6]~q ;

assign stsourcedata[7] = \spislave_0|SPIPhy_single_output_pipeline_stage|out_data[7]~q ;

fiftyfivenm_io_obuf \miso~output (
	.i(\spislave_0|SPIPhy_MISOctl|rdshiftreg[7]~q ),
	.oe(!\nss~input_o ),
	.seriesterminationcontrol(16'b0000000000000000),
	.o(miso),
	.obar());
defparam \miso~output .bus_hold = "false";
defparam \miso~output .open_drain_output = "false";

assign \nss~input_o  = nss;

assign \miso~input_o  = miso;

endmodule

module SPISlave_SPIPhy (
	out_valid,
	out_data_0,
	out_data_1,
	out_data_2,
	out_data_3,
	out_data_4,
	out_data_5,
	out_data_6,
	out_data_7,
	rdshiftreg_7,
	in_ready,
	stsinkvalid,
	stsinkdata_0,
	stsinkdata_2,
	stsinkdata_1,
	stsinkdata_3,
	stsinkdata_6,
	stsinkdata_4,
	stsinkdata_5,
	stsinkdata_7,
	sysclk,
	nss,
	nreset,
	stsourceready,
	sclk,
	mosi)/* synthesis synthesis_greybox=0 */;
output 	out_valid;
output 	out_data_0;
output 	out_data_1;
output 	out_data_2;
output 	out_data_3;
output 	out_data_4;
output 	out_data_5;
output 	out_data_6;
output 	out_data_7;
output 	rdshiftreg_7;
output 	in_ready;
input 	stsinkvalid;
input 	stsinkdata_0;
input 	stsinkdata_2;
input 	stsinkdata_1;
input 	stsinkdata_3;
input 	stsinkdata_6;
input 	stsinkdata_4;
input 	stsinkdata_5;
input 	stsinkdata_7;
input 	sysclk;
input 	nss;
input 	nreset;
input 	stsourceready;
input 	sclk;
input 	mosi;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \SPIPhy_MISOctl|sync_miso_stsinkready|dreg[2]~q ;
wire \SPIPhy_MISOctl|d3_stsinkready~q ;
wire \SPIPhy_altera_avalon_st_idle_inserter|in_ready~2_combout ;
wire \SPIPhy_altera_avalon_st_idle_inserter|received_esc~q ;
wire \SPIPhy_MISOctl|rdshiftreg[7]~2_combout ;
wire \SPIPhy_MISOctl|spi_domain_reset~combout ;
wire \SPIPhy_MOSIctl|sync_mosi_stsrcvalid|dreg[2]~q ;
wire \SPIPhy_MOSIctl|d3_stsrcvalid~q ;
wire \SPIPhy_MOSIctl|stsourcedata[6]~q ;
wire \SPIPhy_MOSIctl|stsourcedata[7]~q ;
wire \SPIPhy_MOSIctl|stsourcedata[5]~q ;
wire \SPIPhy_MOSIctl|stsourcedata[4]~q ;
wire \SPIPhy_MOSIctl|stsourcedata[1]~q ;
wire \SPIPhy_MOSIctl|stsourcedata[0]~q ;
wire \SPIPhy_MOSIctl|stsourcedata[2]~q ;
wire \SPIPhy_MOSIctl|stsourcedata[3]~q ;
wire \SPIPhy_altera_avalon_st_idle_remover|out_valid~3_combout ;
wire \SPIPhy_altera_avalon_st_idle_remover|out_data[5]~0_combout ;


SPISlave_spi_phy_internal_altera_avalon_st_idle_inserter SPIPhy_altera_avalon_st_idle_inserter(
	.dreg_2(\SPIPhy_MISOctl|sync_miso_stsinkready|dreg[2]~q ),
	.d3_stsinkready(\SPIPhy_MISOctl|d3_stsinkready~q ),
	.in_ready(\SPIPhy_altera_avalon_st_idle_inserter|in_ready~2_combout ),
	.received_esc1(\SPIPhy_altera_avalon_st_idle_inserter|received_esc~q ),
	.rdshiftreg_7(\SPIPhy_MISOctl|rdshiftreg[7]~2_combout ),
	.in_ready1(in_ready),
	.stsinkvalid(stsinkvalid),
	.stsinkdata_0(stsinkdata_0),
	.stsinkdata_2(stsinkdata_2),
	.stsinkdata_1(stsinkdata_1),
	.clk(sysclk),
	.reset_n(nreset));

SPISlave_single_output_pipeline_stage SPIPhy_single_output_pipeline_stage(
	.out_valid1(out_valid),
	.out_data_0(out_data_0),
	.out_data_1(out_data_1),
	.out_data_2(out_data_2),
	.out_data_3(out_data_3),
	.out_data_4(out_data_4),
	.out_data_5(out_data_5),
	.out_data_6(out_data_6),
	.out_data_7(out_data_7),
	.stsourcedata_6(\SPIPhy_MOSIctl|stsourcedata[6]~q ),
	.stsourcedata_7(\SPIPhy_MOSIctl|stsourcedata[7]~q ),
	.stsourcedata_4(\SPIPhy_MOSIctl|stsourcedata[4]~q ),
	.stsourcedata_1(\SPIPhy_MOSIctl|stsourcedata[1]~q ),
	.stsourcedata_0(\SPIPhy_MOSIctl|stsourcedata[0]~q ),
	.stsourcedata_2(\SPIPhy_MOSIctl|stsourcedata[2]~q ),
	.stsourcedata_3(\SPIPhy_MOSIctl|stsourcedata[3]~q ),
	.out_valid2(\SPIPhy_altera_avalon_st_idle_remover|out_valid~3_combout ),
	.out_data_51(\SPIPhy_altera_avalon_st_idle_remover|out_data[5]~0_combout ),
	.sysclk(sysclk),
	.nreset(nreset),
	.stsourceready(stsourceready));

SPISlave_spi_phy_internal_altera_avalon_st_idle_remover SPIPhy_altera_avalon_st_idle_remover(
	.dreg_2(\SPIPhy_MOSIctl|sync_mosi_stsrcvalid|dreg[2]~q ),
	.d3_stsrcvalid(\SPIPhy_MOSIctl|d3_stsrcvalid~q ),
	.stsourcedata_6(\SPIPhy_MOSIctl|stsourcedata[6]~q ),
	.stsourcedata_7(\SPIPhy_MOSIctl|stsourcedata[7]~q ),
	.stsourcedata_5(\SPIPhy_MOSIctl|stsourcedata[5]~q ),
	.stsourcedata_4(\SPIPhy_MOSIctl|stsourcedata[4]~q ),
	.stsourcedata_1(\SPIPhy_MOSIctl|stsourcedata[1]~q ),
	.stsourcedata_0(\SPIPhy_MOSIctl|stsourcedata[0]~q ),
	.stsourcedata_2(\SPIPhy_MOSIctl|stsourcedata[2]~q ),
	.stsourcedata_3(\SPIPhy_MOSIctl|stsourcedata[3]~q ),
	.out_valid(\SPIPhy_altera_avalon_st_idle_remover|out_valid~3_combout ),
	.out_data_5(\SPIPhy_altera_avalon_st_idle_remover|out_data[5]~0_combout ),
	.clk(sysclk),
	.reset_n(nreset),
	.stsourceready(stsourceready));

SPISlave_MISOctl SPIPhy_MISOctl(
	.dreg_2(\SPIPhy_MISOctl|sync_miso_stsinkready|dreg[2]~q ),
	.d3_stsinkready1(\SPIPhy_MISOctl|d3_stsinkready~q ),
	.in_ready(\SPIPhy_altera_avalon_st_idle_inserter|in_ready~2_combout ),
	.received_esc(\SPIPhy_altera_avalon_st_idle_inserter|received_esc~q ),
	.rdshiftreg_7(\SPIPhy_MISOctl|rdshiftreg[7]~2_combout ),
	.spi_domain_reset1(\SPIPhy_MISOctl|spi_domain_reset~combout ),
	.rdshiftreg_71(rdshiftreg_7),
	.stsinkvalid(stsinkvalid),
	.stsinkdata_0(stsinkdata_0),
	.stsinkdata_2(stsinkdata_2),
	.stsinkdata_1(stsinkdata_1),
	.stsinkdata_3(stsinkdata_3),
	.stsinkdata_6(stsinkdata_6),
	.stsinkdata_4(stsinkdata_4),
	.stsinkdata_5(stsinkdata_5),
	.stsinkdata_7(stsinkdata_7),
	.sysclk(sysclk),
	.nss(nss),
	.nreset(nreset),
	.sclk(sclk));

SPISlave_MOSIctl SPIPhy_MOSIctl(
	.spi_domain_reset(\SPIPhy_MISOctl|spi_domain_reset~combout ),
	.dreg_2(\SPIPhy_MOSIctl|sync_mosi_stsrcvalid|dreg[2]~q ),
	.d3_stsrcvalid1(\SPIPhy_MOSIctl|d3_stsrcvalid~q ),
	.stsourcedata_6(\SPIPhy_MOSIctl|stsourcedata[6]~q ),
	.stsourcedata_7(\SPIPhy_MOSIctl|stsourcedata[7]~q ),
	.stsourcedata_5(\SPIPhy_MOSIctl|stsourcedata[5]~q ),
	.stsourcedata_4(\SPIPhy_MOSIctl|stsourcedata[4]~q ),
	.stsourcedata_1(\SPIPhy_MOSIctl|stsourcedata[1]~q ),
	.stsourcedata_0(\SPIPhy_MOSIctl|stsourcedata[0]~q ),
	.stsourcedata_2(\SPIPhy_MOSIctl|stsourcedata[2]~q ),
	.stsourcedata_3(\SPIPhy_MOSIctl|stsourcedata[3]~q ),
	.sysclk(sysclk),
	.nreset(nreset),
	.sclk(sclk),
	.mosi(mosi));

endmodule

module SPISlave_MISOctl (
	dreg_2,
	d3_stsinkready1,
	in_ready,
	received_esc,
	rdshiftreg_7,
	spi_domain_reset1,
	rdshiftreg_71,
	stsinkvalid,
	stsinkdata_0,
	stsinkdata_2,
	stsinkdata_1,
	stsinkdata_3,
	stsinkdata_6,
	stsinkdata_4,
	stsinkdata_5,
	stsinkdata_7,
	sysclk,
	nss,
	nreset,
	sclk)/* synthesis synthesis_greybox=0 */;
output 	dreg_2;
output 	d3_stsinkready1;
input 	in_ready;
input 	received_esc;
output 	rdshiftreg_7;
output 	spi_domain_reset1;
output 	rdshiftreg_71;
input 	stsinkvalid;
input 	stsinkdata_0;
input 	stsinkdata_2;
input 	stsinkdata_1;
input 	stsinkdata_3;
input 	stsinkdata_6;
input 	stsinkdata_4;
input 	stsinkdata_5;
input 	stsinkdata_7;
input 	sysclk;
input 	nss;
input 	nreset;
input 	sclk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \loadstsinkdata~q ;
wire \sync_miso_ack|dreg[2]~q ;
wire \loadstsinkdata~0_combout ;
wire \rdshiftreg[7]~1_combout ;
wire \rdshiftreg[7]~3_combout ;
wire \rdshiftreg[7]~4_combout ;
wire \sclkpedgecounter[0]~2_combout ;
wire \sclkpedgecounter[0]~q ;
wire \sclkpedgecounter[1]~1_combout ;
wire \sclkpedgecounter[1]~q ;
wire \sclkpedgecounter[2]~0_combout ;
wire \sclkpedgecounter[2]~q ;
wire \Equal1~0_combout ;
wire \rdshiftreg[2]~0_combout ;
wire \rdshiftreg~14_combout ;
wire \rdshiftreg[0]~q ;
wire \rdshiftreg~12_combout ;
wire \rdshiftreg~13_combout ;
wire \rdshiftreg[1]~q ;
wire \rdshiftreg[1]~_wirecell_combout ;
wire \rdshiftreg[2]~q ;
wire \rdshiftreg~11_combout ;
wire \rdshiftreg[3]~q ;
wire \rdshiftreg~10_combout ;
wire \rdshiftreg[4]~q ;
wire \rdshiftreg~7_combout ;
wire \rdshiftreg~8_combout ;
wire \rdshiftreg~9_combout ;
wire \rdshiftreg[5]~q ;
wire \rdshiftreg~6_combout ;
wire \rdshiftreg[6]~q ;
wire \rdshiftreg~5_combout ;


SPISlave_altera_std_synchronizer sync_miso_ack(
	.din(dreg_2),
	.reset_n(spi_domain_reset1),
	.dreg_2(\sync_miso_ack|dreg[2]~q ),
	.clk(sclk));

SPISlave_altera_std_synchronizer_1 sync_miso_stsinkready(
	.dreg_2(dreg_2),
	.reset_n(spi_domain_reset1),
	.din(\loadstsinkdata~q ),
	.clk(sysclk));

dffeas loadstsinkdata(
	.clk(sclk),
	.d(\loadstsinkdata~0_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\loadstsinkdata~q ),
	.prn(vcc));
defparam loadstsinkdata.is_wysiwyg = "true";
defparam loadstsinkdata.power_up = "low";

fiftyfivenm_lcell_comb \loadstsinkdata~0 (
	.dataa(\Equal1~0_combout ),
	.datab(\loadstsinkdata~q ),
	.datac(gnd),
	.datad(\sync_miso_ack|dreg[2]~q ),
	.cin(gnd),
	.combout(\loadstsinkdata~0_combout ),
	.cout());
defparam \loadstsinkdata~0 .lut_mask = 16'h55DD;
defparam \loadstsinkdata~0 .sum_lutc_input = "datac";

dffeas d3_stsinkready(
	.clk(sysclk),
	.d(dreg_2),
	.asdata(vcc),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(d3_stsinkready1),
	.prn(vcc));
defparam d3_stsinkready.is_wysiwyg = "true";
defparam d3_stsinkready.power_up = "low";

fiftyfivenm_lcell_comb \rdshiftreg[7]~2 (
	.dataa(in_ready),
	.datab(\rdshiftreg[7]~1_combout ),
	.datac(stsinkdata_7),
	.datad(received_esc),
	.cin(gnd),
	.combout(rdshiftreg_7),
	.cout());
defparam \rdshiftreg[7]~2 .lut_mask = 16'h0008;
defparam \rdshiftreg[7]~2 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb spi_domain_reset(
	.dataa(nss),
	.datab(gnd),
	.datac(gnd),
	.datad(nreset),
	.cin(gnd),
	.combout(spi_domain_reset1),
	.cout());
defparam spi_domain_reset.lut_mask = 16'hAAFF;
defparam spi_domain_reset.sum_lutc_input = "datac";

dffeas \rdshiftreg[7] (
	.clk(sclk),
	.d(\rdshiftreg~5_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(rdshiftreg_71),
	.prn(vcc));
defparam \rdshiftreg[7] .is_wysiwyg = "true";
defparam \rdshiftreg[7] .power_up = "low";

fiftyfivenm_lcell_comb \rdshiftreg[7]~1 (
	.dataa(stsinkdata_3),
	.datab(stsinkdata_6),
	.datac(stsinkdata_4),
	.datad(stsinkdata_5),
	.cin(gnd),
	.combout(\rdshiftreg[7]~1_combout ),
	.cout());
defparam \rdshiftreg[7]~1 .lut_mask = 16'h0008;
defparam \rdshiftreg[7]~1 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \rdshiftreg[7]~3 (
	.dataa(gnd),
	.datab(gnd),
	.datac(stsinkdata_7),
	.datad(received_esc),
	.cin(gnd),
	.combout(\rdshiftreg[7]~3_combout ),
	.cout());
defparam \rdshiftreg[7]~3 .lut_mask = 16'h000F;
defparam \rdshiftreg[7]~3 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \rdshiftreg[7]~4 (
	.dataa(stsinkvalid),
	.datab(in_ready),
	.datac(\rdshiftreg[7]~1_combout ),
	.datad(\rdshiftreg[7]~3_combout ),
	.cin(gnd),
	.combout(\rdshiftreg[7]~4_combout ),
	.cout());
defparam \rdshiftreg[7]~4 .lut_mask = 16'h2AAA;
defparam \rdshiftreg[7]~4 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \sclkpedgecounter[0]~2 (
	.dataa(\sclkpedgecounter[0]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\sclkpedgecounter[0]~2_combout ),
	.cout());
defparam \sclkpedgecounter[0]~2 .lut_mask = 16'h5555;
defparam \sclkpedgecounter[0]~2 .sum_lutc_input = "datac";

dffeas \sclkpedgecounter[0] (
	.clk(sclk),
	.d(\sclkpedgecounter[0]~2_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sclkpedgecounter[0]~q ),
	.prn(vcc));
defparam \sclkpedgecounter[0] .is_wysiwyg = "true";
defparam \sclkpedgecounter[0] .power_up = "low";

fiftyfivenm_lcell_comb \sclkpedgecounter[1]~1 (
	.dataa(gnd),
	.datab(gnd),
	.datac(\sclkpedgecounter[1]~q ),
	.datad(\sclkpedgecounter[0]~q ),
	.cin(gnd),
	.combout(\sclkpedgecounter[1]~1_combout ),
	.cout());
defparam \sclkpedgecounter[1]~1 .lut_mask = 16'h0FF0;
defparam \sclkpedgecounter[1]~1 .sum_lutc_input = "datac";

dffeas \sclkpedgecounter[1] (
	.clk(sclk),
	.d(\sclkpedgecounter[1]~1_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sclkpedgecounter[1]~q ),
	.prn(vcc));
defparam \sclkpedgecounter[1] .is_wysiwyg = "true";
defparam \sclkpedgecounter[1] .power_up = "low";

fiftyfivenm_lcell_comb \sclkpedgecounter[2]~0 (
	.dataa(gnd),
	.datab(\sclkpedgecounter[2]~q ),
	.datac(\sclkpedgecounter[1]~q ),
	.datad(\sclkpedgecounter[0]~q ),
	.cin(gnd),
	.combout(\sclkpedgecounter[2]~0_combout ),
	.cout());
defparam \sclkpedgecounter[2]~0 .lut_mask = 16'h3CCC;
defparam \sclkpedgecounter[2]~0 .sum_lutc_input = "datac";

dffeas \sclkpedgecounter[2] (
	.clk(sclk),
	.d(\sclkpedgecounter[2]~0_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sclkpedgecounter[2]~q ),
	.prn(vcc));
defparam \sclkpedgecounter[2] .is_wysiwyg = "true";
defparam \sclkpedgecounter[2] .power_up = "low";

fiftyfivenm_lcell_comb \Equal1~0 (
	.dataa(gnd),
	.datab(\sclkpedgecounter[2]~q ),
	.datac(\sclkpedgecounter[1]~q ),
	.datad(\sclkpedgecounter[0]~q ),
	.cin(gnd),
	.combout(\Equal1~0_combout ),
	.cout());
defparam \Equal1~0 .lut_mask = 16'hFFFC;
defparam \Equal1~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \rdshiftreg[2]~0 (
	.dataa(stsinkvalid),
	.datab(stsinkdata_2),
	.datac(gnd),
	.datad(\rdshiftreg[7]~4_combout ),
	.cin(gnd),
	.combout(\rdshiftreg[2]~0_combout ),
	.cout());
defparam \rdshiftreg[2]~0 .lut_mask = 16'hCCAA;
defparam \rdshiftreg[2]~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \rdshiftreg~14 (
	.dataa(stsinkvalid),
	.datab(\Equal1~0_combout ),
	.datac(stsinkdata_0),
	.datad(rdshiftreg_7),
	.cin(gnd),
	.combout(\rdshiftreg~14_combout ),
	.cout());
defparam \rdshiftreg~14 .lut_mask = 16'h2220;
defparam \rdshiftreg~14 .sum_lutc_input = "datac";

dffeas \rdshiftreg[0] (
	.clk(sclk),
	.d(\rdshiftreg~14_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rdshiftreg[0]~q ),
	.prn(vcc));
defparam \rdshiftreg[0] .is_wysiwyg = "true";
defparam \rdshiftreg[0] .power_up = "low";

fiftyfivenm_lcell_comb \rdshiftreg~12 (
	.dataa(\rdshiftreg[0]~q ),
	.datab(gnd),
	.datac(\Equal1~0_combout ),
	.datad(stsinkvalid),
	.cin(gnd),
	.combout(\rdshiftreg~12_combout ),
	.cout());
defparam \rdshiftreg~12 .lut_mask = 16'hA0AF;
defparam \rdshiftreg~12 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \rdshiftreg~13 (
	.dataa(\rdshiftreg~12_combout ),
	.datab(stsinkdata_1),
	.datac(\rdshiftreg[7]~4_combout ),
	.datad(\Equal1~0_combout ),
	.cin(gnd),
	.combout(\rdshiftreg~13_combout ),
	.cout());
defparam \rdshiftreg~13 .lut_mask = 16'h5515;
defparam \rdshiftreg~13 .sum_lutc_input = "datac";

dffeas \rdshiftreg[1] (
	.clk(sclk),
	.d(\rdshiftreg~13_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rdshiftreg[1]~q ),
	.prn(vcc));
defparam \rdshiftreg[1] .is_wysiwyg = "true";
defparam \rdshiftreg[1] .power_up = "low";

fiftyfivenm_lcell_comb \rdshiftreg[1]~_wirecell (
	.dataa(\rdshiftreg[1]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\rdshiftreg[1]~_wirecell_combout ),
	.cout());
defparam \rdshiftreg[1]~_wirecell .lut_mask = 16'h5555;
defparam \rdshiftreg[1]~_wirecell .sum_lutc_input = "datac";

dffeas \rdshiftreg[2] (
	.clk(sclk),
	.d(\rdshiftreg[2]~0_combout ),
	.asdata(\rdshiftreg[1]~_wirecell_combout ),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(\Equal1~0_combout ),
	.ena(vcc),
	.q(\rdshiftreg[2]~q ),
	.prn(vcc));
defparam \rdshiftreg[2] .is_wysiwyg = "true";
defparam \rdshiftreg[2] .power_up = "low";

fiftyfivenm_lcell_comb \rdshiftreg~11 (
	.dataa(stsinkdata_3),
	.datab(\rdshiftreg[2]~q ),
	.datac(\Equal1~0_combout ),
	.datad(\rdshiftreg[7]~4_combout ),
	.cin(gnd),
	.combout(\rdshiftreg~11_combout ),
	.cout());
defparam \rdshiftreg~11 .lut_mask = 16'h3530;
defparam \rdshiftreg~11 .sum_lutc_input = "datac";

dffeas \rdshiftreg[3] (
	.clk(sclk),
	.d(\rdshiftreg~11_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rdshiftreg[3]~q ),
	.prn(vcc));
defparam \rdshiftreg[3] .is_wysiwyg = "true";
defparam \rdshiftreg[3] .power_up = "low";

fiftyfivenm_lcell_comb \rdshiftreg~10 (
	.dataa(stsinkdata_4),
	.datab(\rdshiftreg[7]~4_combout ),
	.datac(\Equal1~0_combout ),
	.datad(\rdshiftreg[3]~q ),
	.cin(gnd),
	.combout(\rdshiftreg~10_combout ),
	.cout());
defparam \rdshiftreg~10 .lut_mask = 16'h08F8;
defparam \rdshiftreg~10 .sum_lutc_input = "datac";

dffeas \rdshiftreg[4] (
	.clk(sclk),
	.d(\rdshiftreg~10_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rdshiftreg[4]~q ),
	.prn(vcc));
defparam \rdshiftreg[4] .is_wysiwyg = "true";
defparam \rdshiftreg[4] .power_up = "low";

fiftyfivenm_lcell_comb \rdshiftreg~7 (
	.dataa(\rdshiftreg[4]~q ),
	.datab(\sclkpedgecounter[2]~q ),
	.datac(\sclkpedgecounter[1]~q ),
	.datad(\sclkpedgecounter[0]~q ),
	.cin(gnd),
	.combout(\rdshiftreg~7_combout ),
	.cout());
defparam \rdshiftreg~7 .lut_mask = 16'hAAA8;
defparam \rdshiftreg~7 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \rdshiftreg~8 (
	.dataa(stsinkvalid),
	.datab(\sclkpedgecounter[2]~q ),
	.datac(\sclkpedgecounter[1]~q ),
	.datad(\sclkpedgecounter[0]~q ),
	.cin(gnd),
	.combout(\rdshiftreg~8_combout ),
	.cout());
defparam \rdshiftreg~8 .lut_mask = 16'h0002;
defparam \rdshiftreg~8 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \rdshiftreg~9 (
	.dataa(\rdshiftreg~7_combout ),
	.datab(\rdshiftreg~8_combout ),
	.datac(stsinkdata_5),
	.datad(received_esc),
	.cin(gnd),
	.combout(\rdshiftreg~9_combout ),
	.cout());
defparam \rdshiftreg~9 .lut_mask = 16'hAEEA;
defparam \rdshiftreg~9 .sum_lutc_input = "datac";

dffeas \rdshiftreg[5] (
	.clk(sclk),
	.d(\rdshiftreg~9_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rdshiftreg[5]~q ),
	.prn(vcc));
defparam \rdshiftreg[5] .is_wysiwyg = "true";
defparam \rdshiftreg[5] .power_up = "low";

fiftyfivenm_lcell_comb \rdshiftreg~6 (
	.dataa(stsinkdata_6),
	.datab(\rdshiftreg[5]~q ),
	.datac(\Equal1~0_combout ),
	.datad(\rdshiftreg[7]~4_combout ),
	.cin(gnd),
	.combout(\rdshiftreg~6_combout ),
	.cout());
defparam \rdshiftreg~6 .lut_mask = 16'h3530;
defparam \rdshiftreg~6 .sum_lutc_input = "datac";

dffeas \rdshiftreg[6] (
	.clk(sclk),
	.d(\rdshiftreg~6_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset1),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\rdshiftreg[6]~q ),
	.prn(vcc));
defparam \rdshiftreg[6] .is_wysiwyg = "true";
defparam \rdshiftreg[6] .power_up = "low";

fiftyfivenm_lcell_comb \rdshiftreg~5 (
	.dataa(stsinkdata_7),
	.datab(\rdshiftreg[7]~4_combout ),
	.datac(\Equal1~0_combout ),
	.datad(\rdshiftreg[6]~q ),
	.cin(gnd),
	.combout(\rdshiftreg~5_combout ),
	.cout());
defparam \rdshiftreg~5 .lut_mask = 16'h08F8;
defparam \rdshiftreg~5 .sum_lutc_input = "datac";

endmodule

module SPISlave_altera_std_synchronizer (
	din,
	reset_n,
	dreg_2,
	clk)/* synthesis synthesis_greybox=0 */;
input 	din;
input 	reset_n;
output 	dreg_2;
input 	clk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \din_s1~q ;
wire \dreg[0]~q ;
wire \dreg[1]~q ;


dffeas \dreg[2] (
	.clk(clk),
	.d(\dreg[1]~q ),
	.asdata(vcc),
	.clrn(!reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(dreg_2),
	.prn(vcc));
defparam \dreg[2] .is_wysiwyg = "true";
defparam \dreg[2] .power_up = "low";

dffeas din_s1(
	.clk(clk),
	.d(din),
	.asdata(vcc),
	.clrn(!reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\din_s1~q ),
	.prn(vcc));
defparam din_s1.is_wysiwyg = "true";
defparam din_s1.power_up = "low";

dffeas \dreg[0] (
	.clk(clk),
	.d(\din_s1~q ),
	.asdata(vcc),
	.clrn(!reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\dreg[0]~q ),
	.prn(vcc));
defparam \dreg[0] .is_wysiwyg = "true";
defparam \dreg[0] .power_up = "low";

dffeas \dreg[1] (
	.clk(clk),
	.d(\dreg[0]~q ),
	.asdata(vcc),
	.clrn(!reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\dreg[1]~q ),
	.prn(vcc));
defparam \dreg[1] .is_wysiwyg = "true";
defparam \dreg[1] .power_up = "low";

endmodule

module SPISlave_altera_std_synchronizer_1 (
	dreg_2,
	reset_n,
	din,
	clk)/* synthesis synthesis_greybox=0 */;
output 	dreg_2;
input 	reset_n;
input 	din;
input 	clk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \din_s1~q ;
wire \dreg[0]~q ;
wire \dreg[1]~q ;


dffeas \dreg[2] (
	.clk(clk),
	.d(\dreg[1]~q ),
	.asdata(vcc),
	.clrn(!reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(dreg_2),
	.prn(vcc));
defparam \dreg[2] .is_wysiwyg = "true";
defparam \dreg[2] .power_up = "low";

dffeas din_s1(
	.clk(clk),
	.d(din),
	.asdata(vcc),
	.clrn(!reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\din_s1~q ),
	.prn(vcc));
defparam din_s1.is_wysiwyg = "true";
defparam din_s1.power_up = "low";

dffeas \dreg[0] (
	.clk(clk),
	.d(\din_s1~q ),
	.asdata(vcc),
	.clrn(!reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\dreg[0]~q ),
	.prn(vcc));
defparam \dreg[0] .is_wysiwyg = "true";
defparam \dreg[0] .power_up = "low";

dffeas \dreg[1] (
	.clk(clk),
	.d(\dreg[0]~q ),
	.asdata(vcc),
	.clrn(!reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\dreg[1]~q ),
	.prn(vcc));
defparam \dreg[1] .is_wysiwyg = "true";
defparam \dreg[1] .power_up = "low";

endmodule

module SPISlave_MOSIctl (
	spi_domain_reset,
	dreg_2,
	d3_stsrcvalid1,
	stsourcedata_6,
	stsourcedata_7,
	stsourcedata_5,
	stsourcedata_4,
	stsourcedata_1,
	stsourcedata_0,
	stsourcedata_2,
	stsourcedata_3,
	sysclk,
	nreset,
	sclk,
	mosi)/* synthesis synthesis_greybox=0 */;
input 	spi_domain_reset;
output 	dreg_2;
output 	d3_stsrcvalid1;
output 	stsourcedata_6;
output 	stsourcedata_7;
output 	stsourcedata_5;
output 	stsourcedata_4;
output 	stsourcedata_1;
output 	stsourcedata_0;
output 	stsourcedata_2;
output 	stsourcedata_3;
input 	sysclk;
input 	nreset;
input 	sclk;
input 	mosi;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \sendsetvalid~q ;
wire \sync_mosi_ack|dreg[2]~q ;
wire \sendsetvalid~0_combout ;
wire \wrshiftreg[0]~q ;
wire \wrshiftreg[1]~q ;
wire \wrshiftreg[2]~q ;
wire \wrshiftreg[3]~q ;
wire \wrshiftreg[4]~q ;
wire \wrshiftreg[5]~q ;
wire \sclkpedgecounter[0]~2_combout ;
wire \sclkpedgecounter[0]~q ;
wire \sclkpedgecounter[1]~1_combout ;
wire \sclkpedgecounter[1]~q ;
wire \sclkpedgecounter[2]~0_combout ;
wire \sclkpedgecounter[2]~q ;
wire \Equal0~0_combout ;
wire \wrshiftreg[6]~q ;


SPISlave_altera_std_synchronizer_2 sync_mosi_ack(
	.reset_n(spi_domain_reset),
	.din(dreg_2),
	.dreg_2(\sync_mosi_ack|dreg[2]~q ),
	.clk(sclk));

SPISlave_altera_std_synchronizer_3 sync_mosi_stsrcvalid(
	.dreg_2(dreg_2),
	.din(\sendsetvalid~q ),
	.clk(sysclk),
	.reset_n(nreset));

dffeas sendsetvalid(
	.clk(!sclk),
	.d(\sendsetvalid~0_combout ),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sendsetvalid~q ),
	.prn(vcc));
defparam sendsetvalid.is_wysiwyg = "true";
defparam sendsetvalid.power_up = "low";

fiftyfivenm_lcell_comb \sendsetvalid~0 (
	.dataa(\Equal0~0_combout ),
	.datab(\sendsetvalid~q ),
	.datac(gnd),
	.datad(\sync_mosi_ack|dreg[2]~q ),
	.cin(gnd),
	.combout(\sendsetvalid~0_combout ),
	.cout());
defparam \sendsetvalid~0 .lut_mask = 16'hAAEE;
defparam \sendsetvalid~0 .sum_lutc_input = "datac";

dffeas d3_stsrcvalid(
	.clk(sysclk),
	.d(dreg_2),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(d3_stsrcvalid1),
	.prn(vcc));
defparam d3_stsrcvalid.is_wysiwyg = "true";
defparam d3_stsrcvalid.power_up = "low";

dffeas \stsourcedata[6] (
	.clk(!sclk),
	.d(\wrshiftreg[5]~q ),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\Equal0~0_combout ),
	.q(stsourcedata_6),
	.prn(vcc));
defparam \stsourcedata[6] .is_wysiwyg = "true";
defparam \stsourcedata[6] .power_up = "low";

dffeas \stsourcedata[7] (
	.clk(!sclk),
	.d(\wrshiftreg[6]~q ),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\Equal0~0_combout ),
	.q(stsourcedata_7),
	.prn(vcc));
defparam \stsourcedata[7] .is_wysiwyg = "true";
defparam \stsourcedata[7] .power_up = "low";

dffeas \stsourcedata[5] (
	.clk(!sclk),
	.d(\wrshiftreg[4]~q ),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\Equal0~0_combout ),
	.q(stsourcedata_5),
	.prn(vcc));
defparam \stsourcedata[5] .is_wysiwyg = "true";
defparam \stsourcedata[5] .power_up = "low";

dffeas \stsourcedata[4] (
	.clk(!sclk),
	.d(\wrshiftreg[3]~q ),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\Equal0~0_combout ),
	.q(stsourcedata_4),
	.prn(vcc));
defparam \stsourcedata[4] .is_wysiwyg = "true";
defparam \stsourcedata[4] .power_up = "low";

dffeas \stsourcedata[1] (
	.clk(!sclk),
	.d(\wrshiftreg[0]~q ),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\Equal0~0_combout ),
	.q(stsourcedata_1),
	.prn(vcc));
defparam \stsourcedata[1] .is_wysiwyg = "true";
defparam \stsourcedata[1] .power_up = "low";

dffeas \stsourcedata[0] (
	.clk(!sclk),
	.d(mosi),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\Equal0~0_combout ),
	.q(stsourcedata_0),
	.prn(vcc));
defparam \stsourcedata[0] .is_wysiwyg = "true";
defparam \stsourcedata[0] .power_up = "low";

dffeas \stsourcedata[2] (
	.clk(!sclk),
	.d(\wrshiftreg[1]~q ),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\Equal0~0_combout ),
	.q(stsourcedata_2),
	.prn(vcc));
defparam \stsourcedata[2] .is_wysiwyg = "true";
defparam \stsourcedata[2] .power_up = "low";

dffeas \stsourcedata[3] (
	.clk(!sclk),
	.d(\wrshiftreg[2]~q ),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\Equal0~0_combout ),
	.q(stsourcedata_3),
	.prn(vcc));
defparam \stsourcedata[3] .is_wysiwyg = "true";
defparam \stsourcedata[3] .power_up = "low";

dffeas \wrshiftreg[0] (
	.clk(!sclk),
	.d(mosi),
	.asdata(vcc),
	.clrn(!spi_domain_reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\wrshiftreg[0]~q ),
	.prn(vcc));
defparam \wrshiftreg[0] .is_wysiwyg = "true";
defparam \wrshiftreg[0] .power_up = "low";

dffeas \wrshiftreg[1] (
	.clk(!sclk),
	.d(\wrshiftreg[0]~q ),
	.asdata(vcc),
	.clrn(!spi_domain_reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\wrshiftreg[1]~q ),
	.prn(vcc));
defparam \wrshiftreg[1] .is_wysiwyg = "true";
defparam \wrshiftreg[1] .power_up = "low";

dffeas \wrshiftreg[2] (
	.clk(!sclk),
	.d(\wrshiftreg[1]~q ),
	.asdata(vcc),
	.clrn(!spi_domain_reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\wrshiftreg[2]~q ),
	.prn(vcc));
defparam \wrshiftreg[2] .is_wysiwyg = "true";
defparam \wrshiftreg[2] .power_up = "low";

dffeas \wrshiftreg[3] (
	.clk(!sclk),
	.d(\wrshiftreg[2]~q ),
	.asdata(vcc),
	.clrn(!spi_domain_reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\wrshiftreg[3]~q ),
	.prn(vcc));
defparam \wrshiftreg[3] .is_wysiwyg = "true";
defparam \wrshiftreg[3] .power_up = "low";

dffeas \wrshiftreg[4] (
	.clk(!sclk),
	.d(\wrshiftreg[3]~q ),
	.asdata(vcc),
	.clrn(!spi_domain_reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\wrshiftreg[4]~q ),
	.prn(vcc));
defparam \wrshiftreg[4] .is_wysiwyg = "true";
defparam \wrshiftreg[4] .power_up = "low";

dffeas \wrshiftreg[5] (
	.clk(!sclk),
	.d(\wrshiftreg[4]~q ),
	.asdata(vcc),
	.clrn(!spi_domain_reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\wrshiftreg[5]~q ),
	.prn(vcc));
defparam \wrshiftreg[5] .is_wysiwyg = "true";
defparam \wrshiftreg[5] .power_up = "low";

fiftyfivenm_lcell_comb \sclkpedgecounter[0]~2 (
	.dataa(\sclkpedgecounter[0]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.cin(gnd),
	.combout(\sclkpedgecounter[0]~2_combout ),
	.cout());
defparam \sclkpedgecounter[0]~2 .lut_mask = 16'h5555;
defparam \sclkpedgecounter[0]~2 .sum_lutc_input = "datac";

dffeas \sclkpedgecounter[0] (
	.clk(!sclk),
	.d(\sclkpedgecounter[0]~2_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sclkpedgecounter[0]~q ),
	.prn(vcc));
defparam \sclkpedgecounter[0] .is_wysiwyg = "true";
defparam \sclkpedgecounter[0] .power_up = "low";

fiftyfivenm_lcell_comb \sclkpedgecounter[1]~1 (
	.dataa(gnd),
	.datab(gnd),
	.datac(\sclkpedgecounter[1]~q ),
	.datad(\sclkpedgecounter[0]~q ),
	.cin(gnd),
	.combout(\sclkpedgecounter[1]~1_combout ),
	.cout());
defparam \sclkpedgecounter[1]~1 .lut_mask = 16'h0FF0;
defparam \sclkpedgecounter[1]~1 .sum_lutc_input = "datac";

dffeas \sclkpedgecounter[1] (
	.clk(!sclk),
	.d(\sclkpedgecounter[1]~1_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sclkpedgecounter[1]~q ),
	.prn(vcc));
defparam \sclkpedgecounter[1] .is_wysiwyg = "true";
defparam \sclkpedgecounter[1] .power_up = "low";

fiftyfivenm_lcell_comb \sclkpedgecounter[2]~0 (
	.dataa(gnd),
	.datab(\sclkpedgecounter[2]~q ),
	.datac(\sclkpedgecounter[1]~q ),
	.datad(\sclkpedgecounter[0]~q ),
	.cin(gnd),
	.combout(\sclkpedgecounter[2]~0_combout ),
	.cout());
defparam \sclkpedgecounter[2]~0 .lut_mask = 16'h3CCC;
defparam \sclkpedgecounter[2]~0 .sum_lutc_input = "datac";

dffeas \sclkpedgecounter[2] (
	.clk(!sclk),
	.d(\sclkpedgecounter[2]~0_combout ),
	.asdata(vcc),
	.clrn(!spi_domain_reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\sclkpedgecounter[2]~q ),
	.prn(vcc));
defparam \sclkpedgecounter[2] .is_wysiwyg = "true";
defparam \sclkpedgecounter[2] .power_up = "low";

fiftyfivenm_lcell_comb \Equal0~0 (
	.dataa(\sclkpedgecounter[2]~q ),
	.datab(\sclkpedgecounter[1]~q ),
	.datac(\sclkpedgecounter[0]~q ),
	.datad(gnd),
	.cin(gnd),
	.combout(\Equal0~0_combout ),
	.cout());
defparam \Equal0~0 .lut_mask = 16'h8080;
defparam \Equal0~0 .sum_lutc_input = "datac";

dffeas \wrshiftreg[6] (
	.clk(!sclk),
	.d(\wrshiftreg[5]~q ),
	.asdata(vcc),
	.clrn(!spi_domain_reset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\wrshiftreg[6]~q ),
	.prn(vcc));
defparam \wrshiftreg[6] .is_wysiwyg = "true";
defparam \wrshiftreg[6] .power_up = "low";

endmodule

module SPISlave_altera_std_synchronizer_2 (
	reset_n,
	din,
	dreg_2,
	clk)/* synthesis synthesis_greybox=0 */;
input 	reset_n;
input 	din;
output 	dreg_2;
input 	clk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \din_s1~q ;
wire \dreg[0]~q ;
wire \dreg[1]~q ;


dffeas \dreg[2] (
	.clk(!clk),
	.d(\dreg[1]~q ),
	.asdata(vcc),
	.clrn(!reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(dreg_2),
	.prn(vcc));
defparam \dreg[2] .is_wysiwyg = "true";
defparam \dreg[2] .power_up = "low";

dffeas din_s1(
	.clk(!clk),
	.d(din),
	.asdata(vcc),
	.clrn(!reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\din_s1~q ),
	.prn(vcc));
defparam din_s1.is_wysiwyg = "true";
defparam din_s1.power_up = "low";

dffeas \dreg[0] (
	.clk(!clk),
	.d(\din_s1~q ),
	.asdata(vcc),
	.clrn(!reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\dreg[0]~q ),
	.prn(vcc));
defparam \dreg[0] .is_wysiwyg = "true";
defparam \dreg[0] .power_up = "low";

dffeas \dreg[1] (
	.clk(!clk),
	.d(\dreg[0]~q ),
	.asdata(vcc),
	.clrn(!reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\dreg[1]~q ),
	.prn(vcc));
defparam \dreg[1] .is_wysiwyg = "true";
defparam \dreg[1] .power_up = "low";

endmodule

module SPISlave_altera_std_synchronizer_3 (
	dreg_2,
	din,
	clk,
	reset_n)/* synthesis synthesis_greybox=0 */;
output 	dreg_2;
input 	din;
input 	clk;
input 	reset_n;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \din_s1~q ;
wire \dreg[0]~q ;
wire \dreg[1]~q ;


dffeas \dreg[2] (
	.clk(clk),
	.d(\dreg[1]~q ),
	.asdata(vcc),
	.clrn(reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(dreg_2),
	.prn(vcc));
defparam \dreg[2] .is_wysiwyg = "true";
defparam \dreg[2] .power_up = "low";

dffeas din_s1(
	.clk(clk),
	.d(din),
	.asdata(vcc),
	.clrn(reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\din_s1~q ),
	.prn(vcc));
defparam din_s1.is_wysiwyg = "true";
defparam din_s1.power_up = "low";

dffeas \dreg[0] (
	.clk(clk),
	.d(\din_s1~q ),
	.asdata(vcc),
	.clrn(reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\dreg[0]~q ),
	.prn(vcc));
defparam \dreg[0] .is_wysiwyg = "true";
defparam \dreg[0] .power_up = "low";

dffeas \dreg[1] (
	.clk(clk),
	.d(\dreg[0]~q ),
	.asdata(vcc),
	.clrn(reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\dreg[1]~q ),
	.prn(vcc));
defparam \dreg[1] .is_wysiwyg = "true";
defparam \dreg[1] .power_up = "low";

endmodule

module SPISlave_single_output_pipeline_stage (
	out_valid1,
	out_data_0,
	out_data_1,
	out_data_2,
	out_data_3,
	out_data_4,
	out_data_5,
	out_data_6,
	out_data_7,
	stsourcedata_6,
	stsourcedata_7,
	stsourcedata_4,
	stsourcedata_1,
	stsourcedata_0,
	stsourcedata_2,
	stsourcedata_3,
	out_valid2,
	out_data_51,
	sysclk,
	nreset,
	stsourceready)/* synthesis synthesis_greybox=0 */;
output 	out_valid1;
output 	out_data_0;
output 	out_data_1;
output 	out_data_2;
output 	out_data_3;
output 	out_data_4;
output 	out_data_5;
output 	out_data_6;
output 	out_data_7;
input 	stsourcedata_6;
input 	stsourcedata_7;
input 	stsourcedata_4;
input 	stsourcedata_1;
input 	stsourcedata_0;
input 	stsourcedata_2;
input 	stsourcedata_3;
input 	out_valid2;
input 	out_data_51;
input 	sysclk;
input 	nreset;
input 	stsourceready;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \internal_out_ready~combout ;


dffeas out_valid(
	.clk(sysclk),
	.d(out_valid2),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\internal_out_ready~combout ),
	.q(out_valid1),
	.prn(vcc));
defparam out_valid.is_wysiwyg = "true";
defparam out_valid.power_up = "low";

dffeas \out_data[0] (
	.clk(sysclk),
	.d(stsourcedata_0),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\internal_out_ready~combout ),
	.q(out_data_0),
	.prn(vcc));
defparam \out_data[0] .is_wysiwyg = "true";
defparam \out_data[0] .power_up = "low";

dffeas \out_data[1] (
	.clk(sysclk),
	.d(stsourcedata_1),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\internal_out_ready~combout ),
	.q(out_data_1),
	.prn(vcc));
defparam \out_data[1] .is_wysiwyg = "true";
defparam \out_data[1] .power_up = "low";

dffeas \out_data[2] (
	.clk(sysclk),
	.d(stsourcedata_2),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\internal_out_ready~combout ),
	.q(out_data_2),
	.prn(vcc));
defparam \out_data[2] .is_wysiwyg = "true";
defparam \out_data[2] .power_up = "low";

dffeas \out_data[3] (
	.clk(sysclk),
	.d(stsourcedata_3),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\internal_out_ready~combout ),
	.q(out_data_3),
	.prn(vcc));
defparam \out_data[3] .is_wysiwyg = "true";
defparam \out_data[3] .power_up = "low";

dffeas \out_data[4] (
	.clk(sysclk),
	.d(stsourcedata_4),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\internal_out_ready~combout ),
	.q(out_data_4),
	.prn(vcc));
defparam \out_data[4] .is_wysiwyg = "true";
defparam \out_data[4] .power_up = "low";

dffeas \out_data[5] (
	.clk(sysclk),
	.d(out_data_51),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\internal_out_ready~combout ),
	.q(out_data_5),
	.prn(vcc));
defparam \out_data[5] .is_wysiwyg = "true";
defparam \out_data[5] .power_up = "low";

dffeas \out_data[6] (
	.clk(sysclk),
	.d(stsourcedata_6),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\internal_out_ready~combout ),
	.q(out_data_6),
	.prn(vcc));
defparam \out_data[6] .is_wysiwyg = "true";
defparam \out_data[6] .power_up = "low";

dffeas \out_data[7] (
	.clk(sysclk),
	.d(stsourcedata_7),
	.asdata(vcc),
	.clrn(nreset),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\internal_out_ready~combout ),
	.q(out_data_7),
	.prn(vcc));
defparam \out_data[7] .is_wysiwyg = "true";
defparam \out_data[7] .power_up = "low";

fiftyfivenm_lcell_comb internal_out_ready(
	.dataa(stsourceready),
	.datab(gnd),
	.datac(gnd),
	.datad(out_valid1),
	.cin(gnd),
	.combout(\internal_out_ready~combout ),
	.cout());
defparam internal_out_ready.lut_mask = 16'hAAFF;
defparam internal_out_ready.sum_lutc_input = "datac";

endmodule

module SPISlave_spi_phy_internal_altera_avalon_st_idle_inserter (
	dreg_2,
	d3_stsinkready,
	in_ready,
	received_esc1,
	rdshiftreg_7,
	in_ready1,
	stsinkvalid,
	stsinkdata_0,
	stsinkdata_2,
	stsinkdata_1,
	clk,
	reset_n)/* synthesis synthesis_greybox=0 */;
input 	dreg_2;
input 	d3_stsinkready;
output 	in_ready;
output 	received_esc1;
input 	rdshiftreg_7;
output 	in_ready1;
input 	stsinkvalid;
input 	stsinkdata_0;
input 	stsinkdata_2;
input 	stsinkdata_1;
input 	clk;
input 	reset_n;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \received_esc~0_combout ;
wire \received_esc~1_combout ;


fiftyfivenm_lcell_comb \in_ready~2 (
	.dataa(gnd),
	.datab(stsinkdata_0),
	.datac(stsinkdata_2),
	.datad(stsinkdata_1),
	.cin(gnd),
	.combout(in_ready),
	.cout());
defparam \in_ready~2 .lut_mask = 16'h03C0;
defparam \in_ready~2 .sum_lutc_input = "datac";

dffeas received_esc(
	.clk(clk),
	.d(\received_esc~1_combout ),
	.asdata(vcc),
	.clrn(reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(received_esc1),
	.prn(vcc));
defparam received_esc.is_wysiwyg = "true";
defparam received_esc.power_up = "low";

fiftyfivenm_lcell_comb \in_ready~3 (
	.dataa(dreg_2),
	.datab(d3_stsinkready),
	.datac(stsinkvalid),
	.datad(rdshiftreg_7),
	.cin(gnd),
	.combout(in_ready1),
	.cout());
defparam \in_ready~3 .lut_mask = 16'h0222;
defparam \in_ready~3 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \received_esc~0 (
	.dataa(dreg_2),
	.datab(gnd),
	.datac(gnd),
	.datad(d3_stsinkready),
	.cin(gnd),
	.combout(\received_esc~0_combout ),
	.cout());
defparam \received_esc~0 .lut_mask = 16'h00AA;
defparam \received_esc~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \received_esc~1 (
	.dataa(rdshiftreg_7),
	.datab(received_esc1),
	.datac(stsinkvalid),
	.datad(\received_esc~0_combout ),
	.cin(gnd),
	.combout(\received_esc~1_combout ),
	.cout());
defparam \received_esc~1 .lut_mask = 16'hACCC;
defparam \received_esc~1 .sum_lutc_input = "datac";

endmodule

module SPISlave_spi_phy_internal_altera_avalon_st_idle_remover (
	dreg_2,
	d3_stsrcvalid,
	stsourcedata_6,
	stsourcedata_7,
	stsourcedata_5,
	stsourcedata_4,
	stsourcedata_1,
	stsourcedata_0,
	stsourcedata_2,
	stsourcedata_3,
	out_valid,
	out_data_5,
	clk,
	reset_n,
	stsourceready)/* synthesis synthesis_greybox=0 */;
input 	dreg_2;
input 	d3_stsrcvalid;
input 	stsourcedata_6;
input 	stsourcedata_7;
input 	stsourcedata_5;
input 	stsourcedata_4;
input 	stsourcedata_1;
input 	stsourcedata_0;
input 	stsourcedata_2;
input 	stsourcedata_3;
output 	out_valid;
output 	out_data_5;
input 	clk;
input 	reset_n;
input 	stsourceready;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \Equal0~0_combout ;
wire \out_valid~0_combout ;
wire \out_valid~1_combout ;
wire \received_esc~0_combout ;
wire \received_esc~1_combout ;
wire \received_esc~2_combout ;
wire \received_esc~q ;
wire \out_valid~2_combout ;


fiftyfivenm_lcell_comb \out_valid~3 (
	.dataa(\out_valid~1_combout ),
	.datab(\out_valid~2_combout ),
	.datac(stsourcedata_3),
	.datad(\Equal0~0_combout ),
	.cin(gnd),
	.combout(out_valid),
	.cout());
defparam \out_valid~3 .lut_mask = 16'h8AAA;
defparam \out_valid~3 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \out_data[5]~0 (
	.dataa(gnd),
	.datab(gnd),
	.datac(stsourcedata_5),
	.datad(\received_esc~q ),
	.cin(gnd),
	.combout(out_data_5),
	.cout());
defparam \out_data[5]~0 .lut_mask = 16'h0FF0;
defparam \out_data[5]~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \Equal0~0 (
	.dataa(stsourcedata_6),
	.datab(stsourcedata_7),
	.datac(stsourcedata_5),
	.datad(stsourcedata_4),
	.cin(gnd),
	.combout(\Equal0~0_combout ),
	.cout());
defparam \Equal0~0 .lut_mask = 16'h0002;
defparam \Equal0~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \out_valid~0 (
	.dataa(stsourcedata_1),
	.datab(stsourcedata_0),
	.datac(stsourcedata_2),
	.datad(stsourcedata_3),
	.cin(gnd),
	.combout(\out_valid~0_combout ),
	.cout());
defparam \out_valid~0 .lut_mask = 16'h0200;
defparam \out_valid~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \out_valid~1 (
	.dataa(dreg_2),
	.datab(d3_stsrcvalid),
	.datac(\Equal0~0_combout ),
	.datad(\out_valid~0_combout ),
	.cin(gnd),
	.combout(\out_valid~1_combout ),
	.cout());
defparam \out_valid~1 .lut_mask = 16'h0222;
defparam \out_valid~1 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \received_esc~0 (
	.dataa(dreg_2),
	.datab(stsourceready),
	.datac(gnd),
	.datad(d3_stsrcvalid),
	.cin(gnd),
	.combout(\received_esc~0_combout ),
	.cout());
defparam \received_esc~0 .lut_mask = 16'h0088;
defparam \received_esc~0 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \received_esc~1 (
	.dataa(stsourcedata_3),
	.datab(\Equal0~0_combout ),
	.datac(\received_esc~0_combout ),
	.datad(\out_valid~2_combout ),
	.cin(gnd),
	.combout(\received_esc~1_combout ),
	.cout());
defparam \received_esc~1 .lut_mask = 16'h0080;
defparam \received_esc~1 .sum_lutc_input = "datac";

fiftyfivenm_lcell_comb \received_esc~2 (
	.dataa(\received_esc~1_combout ),
	.datab(\received_esc~q ),
	.datac(\out_valid~1_combout ),
	.datad(stsourceready),
	.cin(gnd),
	.combout(\received_esc~2_combout ),
	.cout());
defparam \received_esc~2 .lut_mask = 16'hAEEE;
defparam \received_esc~2 .sum_lutc_input = "datac";

dffeas received_esc(
	.clk(clk),
	.d(\received_esc~2_combout ),
	.asdata(vcc),
	.clrn(reset_n),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\received_esc~q ),
	.prn(vcc));
defparam received_esc.is_wysiwyg = "true";
defparam received_esc.power_up = "low";

fiftyfivenm_lcell_comb \out_valid~2 (
	.dataa(stsourcedata_1),
	.datab(\received_esc~q ),
	.datac(stsourcedata_0),
	.datad(stsourcedata_2),
	.cin(gnd),
	.combout(\out_valid~2_combout ),
	.cout());
defparam \out_valid~2 .lut_mask = 16'hEFFF;
defparam \out_valid~2 .sum_lutc_input = "datac";

endmodule
