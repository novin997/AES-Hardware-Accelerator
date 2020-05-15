module AES_top #(N = 4)(
	//from testbench
	input clk,
	input start,
	input rstn,
	input [128*N-1:0] plain_text,
	input [128*N-1:0] cipher_key,
	//to testbench
	output done,
	output [9:0] completed_round,
	output [128*N-1:0] cipher_text
);
	////enter your code here
	wire accept;
    wire [3:0] rndNo;
    wire enbKS;     
    
    AEScntx AES_control(clk,start,rstn,accept,rndNo,enbKS,done,completed_round);
	
	genvar i;
	generate
		for (i=0; i<N; i=i+1) begin : generate_cores // <-- example block name
		AESCore AES_core(clk,rstn,plain_text[(i+1)*128-1:i*128],cipher_key[(i+1)*128-1:i*128],accept,rndNo,enbKS,cipher_text[(i+1)*128-1:i*128]);
	end 
	endgenerate
	
endmodule
