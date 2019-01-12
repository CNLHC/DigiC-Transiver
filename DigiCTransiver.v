module DigiCTransiver(
	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// Seg7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,

	//////////// VGA //////////
	output		          		VGA_BLANK_N,
	output		     [7:0]		VGA_B,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS,

	//////////// GPIO, GPIO connect to GPIO Default //////////
	inout 		    [35:0]		GPIO,

	//////////// HSMC, HSMC connect to DCC - High Speed ADC/DAC //////////
	input 		          		ADA_DCO,
	input 		    [13:0]		ADA_D,
	output		          		ADA_OE,
	input 		          		ADA_OR,
	output		          		ADA_SPI_CS,
	input 		          		ADB_DCO,
	input 		    [13:0]		ADB_D,
	output		          		ADB_OE,
	input 		          		ADB_OR,
	output		          		ADB_SPI_CS,
	inout 		          		AD_SCLK,
	inout 		          		AD_SDIO,
	inout 		          		AIC_BCLK,
	output		          		AIC_DIN,
	input 		          		AIC_DOUT,
	inout 		          		AIC_LRCIN,
	inout 		          		AIC_LRCOUT,
	output		          		AIC_SPI_CS,
	output		          		AIC_XCLK,
	input 		          		CLKIN1,
	output		          		CLKOUT0,
	output		    [13:0]		DA,
	output		    [13:0]		DB,
	inout 		          		FPGA_CLK_A_N,
	inout 		          		FPGA_CLK_A_P,
	inout 		          		FPGA_CLK_B_N,
	inout 		          		FPGA_CLK_B_P,
	inout 		          		J1_152,
	output		          		SCL,
	inout 		          		SDA,
	input 		          		XT_IN_N,
	input 		          		XT_IN_P
);

    wire [27:0] stm_hw_events;
    assign stm_hw_events    = 0;
    wire DCClock;
  
    assign FPGA_CLK_A_P = DCClock;
    assign FPGA_CLK_A_N =  ~DCClock;
    assign FPGA_CLK_B_N = ~DCClock;
    assign FPGA_CLK_B_P =  DCClock;

    assign  AD_SCLK         = SW[0];            // (DFS)Data Format Select
    assign  AD_SDIO         = SW[1];            // (DCS)Duty Cycle Stabilizer Select
    assign  ADA_OE          = 1'b0;             // enable ADA output
    assign  ADA_SPI_CS      = 1'b1;             // disable ADA_SPI_CS (CSB)
    assign  ADB_OE          = 1'b0;             // enable ADB output
    assign  ADB_SPI_CS      = 1'b1;             // disable ADB_SPI_CS (CSB)
    wire globalReset;
    assign globalReset=KEY[0];
    wire signalTapPLL;


	DigiCQSys u0 (
		.global_reset_reset_n                                    (globalReset),                                    
		.qsys_clkin_clk                                          (CLOCK_50),                                          
		.transmittertopqsys_0_externalspi_export_0_mosi          (GPIO[0]),          
		.transmittertopqsys_0_externalspi_export_0_nss           (GPIO[1]),           
		.transmittertopqsys_0_externalspi_export_0_miso          (GPIO[2]),          
		.transmittertopqsys_0_externalspi_export_0_sclk          (GPIO[3]),          
		.transmittertopqsys_0_ofdmdaccontrol_dac_control_chadata (DA), 
		.transmittertopqsys_0_ofdmdaccontrol_dac_control_chbdata (DB), 
		.signaltaopll_outclk0_clk                                (signalTapPLL),
		.systempll_dccclock_clk									 			(DCClock),
		.receivertopqsys_0_ofdmadccontrol_external_adc_RealData  (ADA_D),  
		.receivertopqsys_0_ofdmadccontrol_external_adc_ImagData  (ADB_D)   
	);
    


    
endmodule
        
