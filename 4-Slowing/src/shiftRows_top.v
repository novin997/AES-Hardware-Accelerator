module shiftRows_top(
	input [127:0] ip,
	output [127:0] op
	);

    assign op[127:120] = ip[127:120];
    assign op[119:112] = ip[87:80];
    assign op[111:104] = ip[47:40];
    assign op[103:96] = ip[7:0];
    assign op[95:88] = ip[95:88];
    assign op[87:80] = ip[55:48];
    assign op[79:72] = ip[15:8];
    assign op[71:64] = ip[103:96];
    assign op[63:56] = ip[63:56];
    assign op[55:48] = ip[23:16];
    assign op[47:40] = ip[111:104];
    assign op[39:32] = ip[71:64];
    assign op[31:24] = ip[31:24];
    assign op[23:16] = ip[119:112];
    assign op[15:8] = ip[79:72];
    assign op[7:0] = ip[39:32];
endmodule
