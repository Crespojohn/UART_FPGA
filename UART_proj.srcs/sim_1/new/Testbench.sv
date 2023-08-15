`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2023 01:55:28 PM
// Design Name: 
// Module Name: Testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Testbench(

    );

    logic clk = 0;
    logic rst = 0;
    logic simclk;
    logic simrst;
    logic UART_0_rxd;
    
reg [3:0]dec_count = 0;
reg [1:0]en_count = 0;
reg [7:0]tx_data;
reg [15:0]tx_data_test;
reg TxD;
reg en = 0;
reg ready = 0;
reg [15:0] en_wait = 0;
wire [15:0]decimal_data;
reg [15:0]decimal_data_l;
wire transmit;
reg [15:0]transmit_delay = 0;
reg load_done;

    
always
begin
    #10ns clk = ~clk;
end

 transmitter T1 (.clk(clk), .reset(rst),.transmit(en),.TxD(TxD),.data(tx_data_test));

always@(posedge clk)begin
    transmit_delay = transmit_delay + 1;
    if(transmit_delay >= 65520)begin
        transmit_delay = 0;
        en = 1;
        
    end
    if(en)begin
        en_wait = en_wait + 1;
        if(en_wait >= 20900)begin
            en_count = en_count + 1;
            en_wait = 0;
            en = 0;
        end
    end
    
    if(en_count%2)begin
        tx_data_test = {4'b0011,dec_count};
    end
    else begin
        tx_data_test =  8'h10;   
    end
    if(dec_count == 4)begin
        decimal_data_l = 32'hABCD1234;
        dec_count = 0;
        tx_data = 8'h10;
    end
    /*if(dec_count == 1'h1)begin
        tx_data = 8'h2E;
        dec_count = dec_count + 1;
    end
    */
    tx_data = {4'b0011,decimal_data_l[15:12]};
    decimal_data_l = decimal_data_l << 4;
    dec_count = dec_count + 1;
end
    

endmodule
