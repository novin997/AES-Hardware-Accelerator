module subBytes_top(
	input [127:0] ip,
	output [127:0] op
	);
    
	wire[7:0] sbox_ip1,sbox_ip2,sbox_ip3,sbox_ip4,sbox_ip5,sbox_ip6,sbox_ip7,sbox_ip8,sbox_ip9,sbox_ip10,sbox_ip11,sbox_ip12,sbox_ip13,sbox_ip14,sbox_ip15,sbox_ip16;
    wire[7:0] sbox_op1,sbox_op2,sbox_op3,sbox_op4,sbox_op5,sbox_op6,sbox_op7,sbox_op8,sbox_op9,sbox_op10,sbox_op11,sbox_op12,sbox_op13,sbox_op14,sbox_op15,sbox_op16;
    
    aes_sbox sbox1(.ip(sbox_ip1),.op(sbox_op1));
    aes_sbox sbox2(.ip(sbox_ip2),.op(sbox_op2));
    aes_sbox sbox3(.ip(sbox_ip3),.op(sbox_op3));
    aes_sbox sbox4(.ip(sbox_ip4),.op(sbox_op4));
    aes_sbox sbox5(.ip(sbox_ip5),.op(sbox_op5));
    aes_sbox sbox6(.ip(sbox_ip6),.op(sbox_op6));
    aes_sbox sbox7(.ip(sbox_ip7),.op(sbox_op7));
    aes_sbox sbox8(.ip(sbox_ip8),.op(sbox_op8));
    aes_sbox sbox9(.ip(sbox_ip9),.op(sbox_op9));
    aes_sbox sbox10(.ip(sbox_ip10),.op(sbox_op10));
    aes_sbox sbox11(.ip(sbox_ip11),.op(sbox_op11));
    aes_sbox sbox12(.ip(sbox_ip12),.op(sbox_op12));
    aes_sbox sbox13(.ip(sbox_ip13),.op(sbox_op13));
    aes_sbox sbox14(.ip(sbox_ip14),.op(sbox_op14));
    aes_sbox sbox15(.ip(sbox_ip15),.op(sbox_op15));
    aes_sbox sbox16(.ip(sbox_ip16),.op(sbox_op16));
    
    assign sbox_ip1 = ip[127:120];
    assign sbox_ip2 = ip[119:112];
    assign sbox_ip3 = ip[111:104];
    assign sbox_ip4 = ip[103:96];
    assign sbox_ip5 = ip[95:88];
    assign sbox_ip6 = ip[87:80];
    assign sbox_ip7 = ip[79:72];
    assign sbox_ip8 = ip[71:64];
    assign sbox_ip9 = ip[63:56];
    assign sbox_ip10 = ip[55:48];
    assign sbox_ip11 = ip[47:40];
    assign sbox_ip12 = ip[39:32];
    assign sbox_ip13 = ip[31:24];
    assign sbox_ip14 = ip[23:16];
    assign sbox_ip15 = ip[15:8];
    assign sbox_ip16 = ip[7:0];
    
    assign op[127:120] = sbox_op1; 
    assign op[119:112] = sbox_op2; 
    assign op[111:104] = sbox_op3;
    assign op[103:96] = sbox_op4;
    assign op[95:88] = sbox_op5; 
    assign op[87:80] = sbox_op6; 
    assign op[79:72] = sbox_op7;
    assign op[71:64] = sbox_op8; 
    assign op[63:56] = sbox_op9;
    assign op[55:48] = sbox_op10; 
    assign op[47:40] = sbox_op11; 
    assign op[39:32]= sbox_op12;
    assign op[31:24] = sbox_op13;
    assign op[23:16] = sbox_op14;
    assign op[15:8] = sbox_op15;
    assign op[7:0] = sbox_op16;
endmodule
