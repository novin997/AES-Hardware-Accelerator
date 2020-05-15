module AEScntx(
	//from testbench
	input  clk,
	input  start,
	input  rstn,
	//to AEScore
	output reg accept,
	output reg [3:0] rndNo,
	output reg enbKS,
	//to testbench
	output reg done,
	output reg [9:0] completed_round
	);
	
    reg[5:0] count = 0;
    
	always @(posedge clk) begin
        if(~rstn)
        begin
            rndNo <= 0;
            count <= 0;
            accept <= 1;
			done <= 0;
            completed_round <= 9'b000000000;     
        end
        else if (start)
        begin
            case(count)
                6'h00:
                begin
					accept <= 0;
					done <= 0;
                    enbKS <= 1;
                    rndNo <= rndNo + 1;
                    completed_round[0] <= 1'b1;                    
                end
                6'h01:
                begin
                    enbKS <= 0;
                end                
                6'h04:
                begin
                    enbKS <= 1;
                    rndNo <= rndNo + 1;
                    completed_round[0] <= 1'b0;
                    completed_round[1] <= 1'b1;
                      
                end                                                
                6'h05:
                begin
                    enbKS <= 0;
                end                
                6'h08:
                begin
                    enbKS <= 1;
                    rndNo <= rndNo + 1;
                    completed_round[1] <= 1'b0;
                    completed_round[2] <= 1'b1;    
                end
                6'h09:
                begin
                    enbKS <= 0;               
                end                
                6'h0C:
                begin
                    enbKS <= 1;
                    rndNo <= rndNo + 1;
                    completed_round[2] <= 1'b0;
                    completed_round[3] <= 1'b1;  
                end
                6'h0D:
                begin
                    enbKS <= 0; 
                end                
                6'h10:
                begin
                    enbKS <= 1;
                    rndNo <= rndNo + 1;
                    completed_round[3] <= 1'b0;
                    completed_round[4] <= 1'b1; 
                end
                6'h11:
                begin
                    enbKS <= 0;                       
                end                
                6'h14:
                begin
                    enbKS <= 1;
                    rndNo <= rndNo + 1;
                    completed_round[4] <= 1'b0;
                    completed_round[5] <= 1'b1; 
                end
                6'h15:
                begin
                    enbKS <= 0;                      
                end                
                6'h18:
                begin
                    enbKS <= 1;
                    rndNo <= rndNo + 1;
                    completed_round[5] <= 1'b0;
                    completed_round[6] <= 1'b1; 
                end
                6'h19:
                begin
                    enbKS <= 0;                          
                end                
                6'h1C:
                begin
                    enbKS <= 1;
                    rndNo <= rndNo + 1;
                    completed_round[6] <= 1'b0;
                    completed_round[7] <= 1'b1; 
                end
                6'h1D:
                begin
                    enbKS <= 0;                        
                end                
                6'h20:
                begin
                    enbKS <= 1;
                    rndNo <= rndNo + 1;
                    completed_round[7] <= 1'b0;
                    completed_round[8] <= 1'b1;
                end
                6'h21:
                begin
                    enbKS <= 0; 
                end                
                6'h24:
                begin
                    enbKS <= 1;
                    rndNo <= rndNo + 1;
                    completed_round[8] <= 1'b0;
                    completed_round[9] <= 1'b1;
                end
                6'h25:
                begin
                    enbKS <= 0;                 
                end                
                6'h27:
                begin
                    done <= 1;
                    completed_round[9] <= 1'b0;
					accept <= 1;
					rndNo <= 0;
                end                                                                                                                                                                  
            endcase
			if(count == 6'h27)
				count <= 0;
			else
				count <= count + 1;                     
        end
    end	
endmodule
