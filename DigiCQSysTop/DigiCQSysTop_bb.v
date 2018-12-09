
module DigiCQSysTop (
	global_reset_reset_n,
	pll_0_locked_export,
	pll_0_outclk_1_clk,
	pll_0_outclk_10_clk,
	pll_0_outclk_120_clk,
	pll_0_outclk_20_clk,
	pll_0_refclk_clk,
	qam_modulation_0_aso_out0_data,
	qam_modulation_0_aso_out0_ready,
	qam_modulation_0_aso_out0_valid,
	qam_modulation_0_aso_out0_empty,
	qam_modulation_0_aso_out0_endofpacket,
	qam_modulation_0_aso_out0_startofpacket,
	qsys_clkin_clk,
	spislave_0_export_0_mosi,
	spislave_0_export_0_nss,
	spislave_0_export_0_miso,
	spislave_0_export_0_sclk);	

	input		global_reset_reset_n;
	output		pll_0_locked_export;
	output		pll_0_outclk_1_clk;
	output		pll_0_outclk_10_clk;
	output		pll_0_outclk_120_clk;
	output		pll_0_outclk_20_clk;
	input		pll_0_refclk_clk;
	output	[32:0]	qam_modulation_0_aso_out0_data;
	input		qam_modulation_0_aso_out0_ready;
	output		qam_modulation_0_aso_out0_valid;
	output		qam_modulation_0_aso_out0_empty;
	output		qam_modulation_0_aso_out0_endofpacket;
	output		qam_modulation_0_aso_out0_startofpacket;
	input		qsys_clkin_clk;
	input		spislave_0_export_0_mosi;
	input		spislave_0_export_0_nss;
	inout		spislave_0_export_0_miso;
	input		spislave_0_export_0_sclk;
endmodule
