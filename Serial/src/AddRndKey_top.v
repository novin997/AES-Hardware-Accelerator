module AddRndKey_top(
	input  [127:0] ip,
	input  [127:0] ip_key,
	output  [127:0] op
	);

	assign op[127:0] = ip[127:0] ^ ip_key[127:0];

endmodule
