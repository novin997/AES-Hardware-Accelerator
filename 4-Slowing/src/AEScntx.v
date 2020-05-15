module AEScntx#(N=4)(
	//from testbench
	input clk,
	input start,
	input rstn,
	//to AEScore
	output reg accept,
	output reg KS_Select,
	output reg [3:0] rndNo,
	//to testbench
	output reg done
	);
	
    reg[5:0] count = 0;
    
	always @(posedge clk) begin
        if(~rstn)
        begin
            // count <= 0;
			// done <= 0;
            // accept <= 0;
            // KS_Select <= 0;
            // rndNo <= 0;    
        end
        else if(start)
		begin
            case(count)
                6'h00:
                begin
					accept <= 1;
					KS_Select <= 1;
					done <= 0;              
                end
                6'h01:
                begin
                    accept <= 1;
					KS_Select <= 1; 
                end                
                6'h02:
                begin
                    accept <= 1;
					KS_Select <= 1;
                end
                6'h03:
                begin
                    KS_Select <= 0;
                    accept <= 1;						
                end
                6'h04:
                begin		
					done <= 0;
					KS_Select <= 0;
                    accept <= 0;
					rndNo <= rndNo + 1;
                end                                                
                6'h09:
                begin
                    rndNo <= rndNo + 1;                          
                end
                6'h0E:
                begin
                    rndNo <= rndNo + 1;                          
                end
                6'h13:
                begin
                    rndNo <= rndNo + 1;                          
                end
                6'h18:
                begin
                    rndNo <= rndNo + 1;                          
                end
                6'h1D:
                begin
                    rndNo <= rndNo + 1;                          
                end
                6'h22:
                begin
                    rndNo <= rndNo + 1;                          
                end
                6'h27:
                begin
                    rndNo <= rndNo + 1;                          
                end
                6'h2C:
                begin
                    rndNo <= rndNo + 1;                          
                end                              
                6'h31:
                begin
                    rndNo <= 0;
                    accept <= 1;     											
                end
                6'h32:
                begin
                    done <= 1;
                    KS_Select <= 1;          										
                end
                6'h36:
                begin
                    accept <= 0;
                    done <= 0;
                end  				
            endcase
			if(count == 6'h36)
				count <= 4;
			else
				count <= count + 1;                 
        end
    end	
endmodule
