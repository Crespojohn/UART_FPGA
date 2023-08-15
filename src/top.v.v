`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2015 12:39:26 AM
// Design Name: 
// Module Name: top
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

module top(
input [7:0]sw,
input btn0,
input btn1,
input clk,
output TxD,
output TxD_debug,
output transmit_debug,
output button_debug, 
output clk_debug,


input vauxp6,
input vauxn6,
input vauxp7,
input vauxn7,
input vauxp15,
input vauxn15,
input vauxp14,
input vauxn14,
input vp_in,
input vn_in,
output reg [15:0] led,
output [3:0] an,        
output dp,              
output [6:0] seg     
); 
reg [1:0]dec_count;
reg [2:0]en_count = 0;
reg [2:0] data_count = 0;
reg [7:0]tx_data;
reg [15:0]tx_data_test;

reg en = 0;
reg [15:0] en_wait = 0;
wire [15:0]decimal_data;
reg [15:0]decimal_data_l;
wire transmit;
reg [15:0]transmit_delay;
wire clear_done;
reg clear_latch = 1;

assign TxD_debug = TxD;
assign transmit_debug = transmit;
assign button_debug = btn1;
assign clk_debug = clk;


transmit_debouncing D2 (.clk(clk), .btn1(btn1), .transmit(transmit));
transmitter T1 (.clk(clk), .reset(btn0),.transmit(en&&~btn0),.TxD(TxD),.data(tx_data_test),.clear_done(clear_done));
XADCdemo XADC(
    .CLK100MHZ   (clk            )      
   ,.vauxp6      (vauxp6         )      
   ,.vauxn6      (vauxn6         )      
   ,.vauxp7      (vauxp7         )      
   ,.vauxn7      (vauxn7         )      
   ,.vauxp15     (vauxp15        )      
   ,.vauxn15     (vauxn15        )      
   ,.vauxp14     (vauxp14        )      
   ,.vauxn14     (vauxn14        )      
   ,.vp_in       (vp_in          )     
   ,.vn_in       (vn_in          )     
   ,.sw          (sw[1:0]        )
   //,.led         (led[15:0]      )
   ,.an          (an [3:0]       )
   ,.dp          (dp             )     
   ,.seg         (seg[6:0]       )
   ,.sseg_data   (decimal_data   )
);

always@(posedge clk)begin
    transmit_delay = transmit_delay + 1;
    if(clear_done) clear_latch = 1;
    if((transmit_delay >= 65520)&&clear_latch)begin
        clear_latch = 0;
        transmit_delay = 0;
        en = 1;
        
    end
    if(en)begin
        en_wait = en_wait + 1;
        if(en_wait >= 20900)begin
            en_count = en_count + 1;
            en_wait = 0;
            en = 0;
            if(en_count == 2)data_count = data_count + 1;
        end
    end
    
    case(en_count)
    2:  tx_data_test = {5'b00110,data_count};
    1:  tx_data_test = 8'h0D;
    0:  tx_data_test =  8'h0A;   
    default : tx_data_test =  8'h0D;
    endcase
    /*
    if(dec_count == 4)begin
        decimal_data_l = 32'hABCD1234;
        dec_count = 0;
        tx_data = 8'h10;
    end
    if(dec_count == 1'h1)begin
        tx_data = 8'h2E;
        dec_count = dec_count + 1;
    end
    
    tx_data = {4'b0011,decimal_data_l[15:12]};
    decimal_data_l = decimal_data_l << 4;
    dec_count = dec_count + 1;
    */
end 

endmodule
