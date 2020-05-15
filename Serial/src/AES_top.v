module AES_top(
	//from testbench
	input  clk,
	input  start,
	input  rstn,
	input  [127:0] plain_text,
	input  [127:0] cipher_key,
	//to testbench
	output  done,
	output  [9:0] completed_round,
	output  [127:0] cipher_text
	);

    wire accept;
    wire [3:0] rndNo;
    wire enbKS;     
    
    AEScntx AES_control(clk,start,rstn,accept,rndNo,enbKS,done,completed_round);
    AESCore AES_core(clk,rstn,plain_text,cipher_key,accept,rndNo,enbKS,cipher_text);

endmodule
