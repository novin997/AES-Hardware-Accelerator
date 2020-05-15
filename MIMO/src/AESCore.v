module AESCore(
	//from testbench
	input  clk,
	input  rstn,
	input  [127:0] plain_text,
	input  [127:0] cipher_key,
	//from controller
	input  accept,
	input  [3:0] rndNo,
	input  enbKS,
	//to testbench
	output [127:0] cipher_text
	);
	
	reg [127:0] key;
	
	wire [127:0] SB_out;
	wire [127:0] SR_out;
	wire [127:0] MC_out;
	wire [127:0] AR_out;
	wire [127:0] KS_out;
	
	reg [127:0] AR_in;
	reg [127:0] SB_in;
	reg [127:0] SR_in;
	reg [127:0] MC_in;
	
	assign cipher_text = AR_out;
	
	subBytes_top subBytes(SB_in,SB_out);
	shiftRows_top shiftRows(SR_in,SR_out);
	MixCol_top mixCol(MC_in,MC_out);
	AddRndKey_top addRndKey(AR_in,key,AR_out);
	KeySchedule_top keySchedule(key,rndNo,KS_out);
	
    always @(posedge clk) begin
        if(!rstn) begin
        end
        else begin     
            if(accept) begin
                AR_in <= plain_text;
                key <= cipher_key; 
            end
			else begin
				SB_in <= AR_out;			
				SR_in <= SB_out;
				MC_in <= SR_out;
				
				if (rndNo == 10)
					AR_in <= SR_out;
				else
					AR_in <= MC_out;
				
				if(enbKS)
					key <= KS_out;
			end
        end
    end
	
endmodule