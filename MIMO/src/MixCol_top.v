module MixCol_top(
	input  [127:0] ip,
	output [127:0] op
	);

    wire[31:0] matrix1_ip,matrix2_ip,matrix3_ip,matrix4_ip;
    wire[31:0] matrix1_op,matrix2_op,matrix3_op,matrix4_op;
    
    matrix_mult mult1(.ip(matrix1_ip),.op(matrix1_op));
    matrix_mult mult2(.ip(matrix2_ip),.op(matrix2_op));
    matrix_mult mult3(.ip(matrix3_ip),.op(matrix3_op));
    matrix_mult mult4(.ip(matrix4_ip),.op(matrix4_op));
    
    assign matrix1_ip[31:0] = ip[127:96];
    assign matrix2_ip[31:0] = ip[95:64];
    assign matrix3_ip[31:0] = ip[63:32];
    assign matrix4_ip[31:0] = ip[31:0];
    
    assign op[127:96] = matrix1_op[31:0];
    assign op[95:64] = matrix2_op[31:0];
    assign op[63:32] = matrix3_op[31:0];
    assign op[31:0] = matrix4_op[31:0];

endmodule
