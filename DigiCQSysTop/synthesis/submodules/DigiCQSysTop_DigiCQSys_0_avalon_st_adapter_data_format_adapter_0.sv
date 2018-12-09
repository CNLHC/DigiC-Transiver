// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// (C) 2001-2013 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.

 
// $Id: //acds/rel/13.1/ip/.../avalon-st_data_format_adapter.sv.terp#1 $
// $Revision: #1 $
// $Date: 2013/09/21 $
// $Author: dmunday $


// --------------------------------------------------------------------------------
//| Avalon Streaming Data Adapter
// --------------------------------------------------------------------------------

`timescale 1ns / 100ps

// ------------------------------------------
// Generation parameters:
//   output_name:        DigiCQSysTop_DigiCQSys_0_avalon_st_adapter_data_format_adapter_0
//   usePackets:         true
//   hasInEmpty:         false
//   inEmptyWidth:       0
//   hasOutEmpty:        true 
//   outEmptyWidth:      2
//   inDataWidth:        8
//   outDataWidth:       32
//   channelWidth:       8
//   inErrorWidth:       0
//   outErrorWidth:      0
//   inSymbolsPerBeat:   1
//   outSymbolsPerBeat:  4
//   maxState:           3
//   stateWidth:         2
//   maxChannel:         255
//   symbolWidth:        8
//   numMemSymbols:      3
//   symbolWidth:        8


// ------------------------------------------

 
module DigiCQSysTop_DigiCQSys_0_avalon_st_adapter_data_format_adapter_0 (
 // Interface: in
 output reg         in_ready,
 input              in_valid,
 input [8-1 : 0]    in_data,
 input [8-1 : 0] in_channel,
 input              in_startofpacket,
 input              in_endofpacket,
 // Interface: out
 input                out_ready,
 output reg           out_valid,
 output reg [32-1: 0]  out_data,
 output reg [8-1: 0] out_channel,
 output reg           out_startofpacket,
 output reg           out_endofpacket,
 output reg [2-1 : 0] out_empty,

  // Interface: clk
 input              clk,
 // Interface: reset
 input              reset_n

);



   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------
   reg  [8-1:0]   state_read_addr;
   wire [2-1:0]   state_from_memory;
   reg  [2-1:0]   state;
   reg  [2-1:0]   new_state;
   reg  [2-1:0]   state_d1;
    
   reg            in_ready_d1;
   reg [8-1:0] mem_readaddr; 
   reg [8-1:0] mem_readaddr_d1;
   reg            a_ready;
   reg            a_valid;
   reg [8-1:0]    a_channel;
   reg [8-1:0]    a_data0; 
   reg            a_startofpacket;
   reg            a_endofpacket;
   reg            a_empty;
   reg            a_error;
   reg            b_ready;
   reg            b_valid;
   reg  [8-1:0]   b_channel;
   reg  [32-1:0]   b_data;
   reg            b_startofpacket; 
   wire           b_startofpacket_wire; 
   reg            b_endofpacket; 
   reg  [2-1:0]   b_empty;
   reg            b_error; 
   reg            mem_write0;
   reg  [8-1:0]   mem_writedata0;
   wire [8-1:0]   mem_readdata0;
   wire           mem_waitrequest0;
   reg  [8-1:0]   mem0[0:255];
   reg            mem_write1;
   reg  [8-1:0]   mem_writedata1;
   wire [8-1:0]   mem_readdata1;
   wire           mem_waitrequest1;
   reg  [8-1:0]   mem1[0:255];
   reg            mem_write2;
   reg  [8-1:0]   mem_writedata2;
   wire [8-1:0]   mem_readdata2;
   wire           mem_waitrequest2;
   reg  [8-1:0]   mem2[0:255];
   reg            sop_mem_writeenable;
   reg            sop_mem_writedata;
   wire           mem_waitrequest_sop; 

   wire           state_waitrequest;
   reg            state_waitrequest_d1; 



   reg  [1-1:0] in_empty = 0;

   reg in_error = 0;
   reg out_error; 

   wire           error_from_mem;
   reg            error_mem_writedata;
   reg          error_mem_writeenable;


   // ---------------------------------------------------------------------
   //| Input Register Stage
   // ---------------------------------------------------------------------
   always @(posedge clk or negedge reset_n) begin
      if (!reset_n) begin
         a_valid   <= 0;
         a_channel <= 0;
         a_data0   <= 0;
         a_startofpacket <= 0;
         a_endofpacket   <= 0;
         a_empty <= 0; 
         a_error <= 0;
      end else begin
         if (in_ready) begin
            a_valid   <= in_valid;
            a_channel <= in_channel;
            a_error   <= in_error;
            a_data0 <= in_data[7:0];
            a_startofpacket <= in_startofpacket;
            a_endofpacket   <= in_endofpacket;
            a_empty         <= 0; 
            if (in_endofpacket)
               a_empty <= in_empty;
         end
      end 
   end

   always @* begin 
      state_read_addr = in_channel;
   end
   
   // ---------------------------------------------------------------------
   //| State Memory
   // ---------------------------------------------------------------------
   DigiCQSysTop_DigiCQSys_0_avalon_st_adapter_data_format_adapter_0_state_ram state_ram ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (state_read_addr),
   .rd0_readdata   (state_from_memory),
   .wr_address     (a_channel),
   .wr_writedata   (new_state),
   .wr_write       (~state_waitrequest_d1),
   .wr_waitrequest (state_waitrequest)
   );

   // ---------------------------------------------------------------------
   //| Data Memories
   // ---------------------------------------------------------------------
   DigiCQSysTop_DigiCQSys_0_avalon_st_adapter_data_format_adapter_0_data_ram data_ram0 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata0),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata0),
   .wr_write       (mem_write0),
   .wr_waitrequest (mem_waitrequest0)
   );
   DigiCQSysTop_DigiCQSys_0_avalon_st_adapter_data_format_adapter_0_data_ram data_ram1 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata1),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata1),
   .wr_write       (mem_write1),
   .wr_waitrequest (mem_waitrequest1)
   );
   DigiCQSysTop_DigiCQSys_0_avalon_st_adapter_data_format_adapter_0_data_ram data_ram2 ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (mem_readdata2),
   .wr_address     (a_channel),
   .wr_writedata   (mem_writedata2),
   .wr_write       (mem_write2),
   .wr_waitrequest (mem_waitrequest2)
   );

   DigiCQSysTop_DigiCQSys_0_avalon_st_adapter_data_format_adapter_0_sop_ram sop_ram ( 
   .clk            (clk),
   .reset_n        (reset_n),
   .rd0_address    (mem_readaddr),
   .rd0_readdata   (b_startofpacket_wire),
   .wr_address     (a_channel),
   .wr_writedata   (sop_mem_writedata),
   .wr_write       (sop_mem_writeenable),
   .wr_waitrequest (mem_waitrequest_sop)
   );


   // ---------------------------------------------------------------------
   //| State & Memory Keepers
   // ---------------------------------------------------------------------
   always @(posedge clk or negedge reset_n) begin
      if (!reset_n) begin
         in_ready_d1          <= 0;
         state_d1             <= 0;
         mem_readaddr_d1      <= 0;
         state_waitrequest_d1 <= 0;
      end else begin
         in_ready_d1          <= in_ready;
         state_d1             <= state;
         mem_readaddr_d1      <= mem_readaddr;
         state_waitrequest_d1 <= state_waitrequest;
      end
   end
   
   
   // ---------------------------------------------------------------------
   //| State Machine
   // ---------------------------------------------------------------------
   always @* begin

      
   b_ready = (out_ready || ~out_valid);

   a_ready   = 0;
   b_data    = 0;
   b_valid   = 0;
   b_channel = a_channel;
   b_error   = a_error;
      
   state = state_from_memory;
   if (~in_ready_d1)
      state = state_d1;
         
   error_mem_writedata = error_from_mem | a_error;
   if (state == 0)
      error_mem_writedata = a_error;
   b_error = error_mem_writedata;
      
   new_state           = state;
   mem_write0          = 0;
   mem_writedata0      = a_data0;
   mem_write1          = 0;
   mem_writedata1      = a_data0;
   mem_write2          = 0;
   mem_writedata2      = a_data0;
   sop_mem_writeenable = 0;

   b_endofpacket = a_endofpacket;
      
   b_startofpacket = 0;
      
   b_startofpacket = b_startofpacket_wire;
   b_empty = 0;
       
   case (state) 
            0 : begin
               mem_writedata0 = a_data0;
               b_data[31:24] = a_data0;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     sop_mem_writeenable = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+3;
                        b_valid = 1;
                        b_startofpacket = a_startofpacket;
                        new_state = 0;
                     end
                  end
               end
            end
         1 : begin
               mem_writedata0 = mem_readdata0;
               b_data[31:24] = mem_readdata0;
               mem_writedata1 = a_data0;
               b_data[23:16] = a_data0;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+2;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         2 : begin
               mem_writedata0 = mem_readdata0;
               b_data[31:24] = mem_readdata0;
               mem_writedata1 = mem_readdata1;
               b_data[23:16] = mem_readdata1;
               mem_writedata2 = a_data0;
               b_data[15:8] = a_data0;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = state+1'b1;
                     mem_write0 = 1;
                     mem_write1 = 1;
                     mem_write2 = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+1;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end
         3 : begin
               b_data[31:24] = mem_readdata0;
               b_data[23:16] = mem_readdata1;
               b_data[15:8] = mem_readdata2;
               b_data[7:0] = a_data0;
               if (out_ready || ~out_valid) begin
                  a_ready = 1;
                  if (a_valid) 
                  begin
                     new_state = 0;
                     b_valid = 1;
                     if (a_endofpacket) begin
                        b_empty = a_empty+0;
                        b_valid = 1;
                        new_state = 0;
                     end
                  end
               end
            end

   endcase

      in_ready = (a_ready || ~a_valid) && ~state_waitrequest;

      mem_readaddr = in_channel; 
      if (~in_ready)
         mem_readaddr = mem_readaddr_d1;

      
      sop_mem_writedata = 0;
      if (a_valid)
         sop_mem_writedata = a_startofpacket;
      if (b_ready && b_valid && b_startofpacket)
         sop_mem_writeenable = 1;

   end


   // ---------------------------------------------------------------------
   //| Output Register Stage
   // ---------------------------------------------------------------------
   always @(posedge clk or negedge reset_n) begin
      if (!reset_n) begin
         out_valid         <= 0;
         out_data          <= 0;
         out_channel       <= 0;
         out_startofpacket <= 0;
         out_endofpacket   <= 0;
         out_empty         <= 0;
         out_error         <= 0;
      end else begin
         if (out_ready || ~out_valid) begin
            out_valid         <= b_valid;
            out_data          <= b_data;
            out_channel       <= b_channel; 
            out_startofpacket <= b_startofpacket;
            out_endofpacket   <= b_endofpacket;
            out_empty         <= b_empty;
            out_error         <= b_error;
         end
      end 
   end
   



endmodule

   

