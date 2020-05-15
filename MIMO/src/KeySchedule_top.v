module KeySchedule_top(
	input  [127:0] ip_key,
	input  [3:0] rndNo,
	output reg [127:0] op_key
	);
	
    wire[7:0] ip1,ip2,ip3,ip4;
    wire[7:0] op1,op2,op3,op4;
    reg[7:0] rconn;
    
    aes_sbox sbox1(ip1,op1);
    aes_sbox sbox2(ip2,op2);
    aes_sbox sbox3(ip3,op3);
    aes_sbox sbox4(ip4,op4);
    
    assign ip1 = ip_key[23:16];
    assign ip2 = ip_key[15:8];
    assign ip3 = ip_key[7:0];
    assign ip4 = ip_key[31:24];
        
    always @(rndNo)
        case(rndNo)
            4'h1: rconn = 8'h01;
            4'h2: rconn = 8'h02;
            4'h3: rconn = 8'h04;
            4'h4: rconn = 8'h08;
            4'h5: rconn = 8'h10;
            4'h6: rconn = 8'h20;
            4'h7: rconn = 8'h40;
            4'h8: rconn = 8'h80;
            4'h9: rconn = 8'h1b;
            4'hA: rconn = 8'h36;
            default: rconn = 8'h00;
        endcase
            
     always @(ip_key,rconn,op1,op2,op3,op4) begin
         op_key[127:120] = op1 ^ ip_key[127:120] ^ rconn;
         op_key[119:112] = op2 ^ ip_key[119:112] ^ 8'h00;
         op_key[111:104] = op3 ^ ip_key[111:104] ^ 8'h00;
         op_key[103:96] = op4 ^ ip_key[103:96] ^ 8'h00;       
            
         op_key[95:88] = ip_key[95:88] ^ op_key[127:120];
         op_key[87:80] = ip_key[87:80] ^ op_key[119:112];
         op_key[79:72] = ip_key[79:72] ^ op_key[111:104];
         op_key[71:64] = ip_key[71:64] ^ op_key[103:96];
                
         op_key[63:56] = ip_key[63:56] ^ op_key[95:88];
         op_key[55:48] = ip_key[55:48] ^ op_key[87:80];
         op_key[47:40] = ip_key[47:40] ^ op_key[79:72];
         op_key[39:32] = ip_key[39:32] ^ op_key[71:64];               
               
         op_key[31:24] = ip_key[31:24] ^ op_key[63:56];
         op_key[23:16] = ip_key[23:16] ^ op_key[55:48];
         op_key[15:8] = ip_key[15:8] ^ op_key[47:40];
         op_key[7:0] = ip_key[7:0] ^ op_key[39:32]; 
     end
endmodule