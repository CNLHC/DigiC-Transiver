
module DigiCQSys (
	global_reset_reset_n,
	ofdm_dac_control_0_dac_control_chadata,
	ofdm_dac_control_0_dac_control_chbdata,
	pll_0_locked_export,
	pll_0_refclk_clk,
	qsys_clkin_clk,
	sc_fifo_0_clk_reset_reset,
	signal_tap_clock_clk,
	spislave_0_export_0_mosi,
	spislave_0_export_0_nss,
	spislave_0_export_0_miso,
	spislave_0_export_0_sclk);	

	input		global_reset_reset_n;
	output	[13:0]	ofdm_dac_control_0_dac_control_chadata;
	output	[13:0]	ofdm_dac_control_0_dac_control_chbdata;
	output		pll_0_locked_export;
	input		pll_0_refclk_clk;
	input		qsys_clkin_clk;
	input		sc_fifo_0_clk_reset_reset;
	output		signal_tap_clock_clk;
	input		spislave_0_export_0_mosi;
	input		spislave_0_export_0_nss;
	inout		spislave_0_export_0_miso;
	input		spislave_0_export_0_sclk;
endmodule
