module AESCore#(N=4)(
	input clk,
	input rstn,
	input [127:0] plain_text,
	input [127:0] cipher_key,
	//from controller
	input accept,
	input KS_Select,
	input [3:0] rndNo,
	//to testbench
	output reg [127:0] cipher_text
	);
	
	//reg [127:0] key;
	//reg [127:0] keySR;
	//reg [127:0] keySB;
	wire [127:0] keyMC;
	wire [127:0] keyAR;
	
	wire [127:0] SB_out;
	wire [127:0] SR_out;
	wire [127:0] MC_out;
	wire [127:0] AR_out;
	wire [127:0] AR2_out;
	wire [127:0] AR3_out;
	wire [127:0] KS_out;

	reg [127:0] keyInput;
	reg [127:0] KS_in;
	reg [127:0] AR_in;
	reg [127:0] AR2_in;
	reg [127:0] AR3_in;
	reg [127:0] SB_in;
	reg [127:0] SR_in;
	reg [127:0] MC_in;
	reg [127:0] MC_delay;

	subBytes_top subBytes(SB_in,SB_out);
	shiftRows_top shiftRows(SR_in,SR_out);
	MixCol_top mixCol(MC_in,MC_out);
	AddRndKey_top addRndKey(AR_in,keyInput,AR_out);
	AddRndKey_top addRndKey2(AR2_in,keyAR,AR2_out);
	AddRndKey_top addRndKey3(AR3_in,keyMC,AR3_out);
	KeySchedule_top keySchedule(KS_in,clk,rndNo,keyAR,keyMC);
	
	always @(posedge clk) begin
		if(accept) begin
			AR_in <= plain_text;
			keyInput <= cipher_key;
		end
		else begin
			AR_in <= 0;
			keyInput <= 0;
		end

		if(rndNo == 0) begin
			SB_in <= AR_out;
		end
		else begin
			SB_in <= AR2_out;	
		end

		if(KS_Select) begin
			KS_in <= cipher_key;
		end
		else begin
			KS_in <= keyMC;	
		end

		SR_in <= SB_out;
		MC_in <= SR_out;
		MC_delay <= MC_out;
		AR2_in <= MC_delay;

		AR3_in <= MC_in;
		
		cipher_text <= AR3_out;
    end
endmodule
