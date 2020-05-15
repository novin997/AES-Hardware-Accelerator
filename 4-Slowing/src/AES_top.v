module AES_top#(N=4)(
	//from testbench
	input clk,
	input start,
	input rstn,
	input [127:0] plain_text,
	input [127:0] cipher_key,
	//to testbench
	output done,
	output [127:0] cipher_text
	);
	
	wire accept;
	wire KS_Select;
    wire [3:0] rndNo;
    
    AEScntx AES_control(clk,start,rstn,accept,KS_Select,rndNo,done);
    AESCore AES_core(clk,rstn,plain_text,cipher_key,accept,KS_Select,rndNo,cipher_text);
	
endmodule
