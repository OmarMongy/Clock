module CLOCK (
    input clk,
    input reset,
    input ena,
    output  pm,
    output  [7:0] hh,
    output  [7:0] mm,
    output  [7:0] ss); 
    
    reg [7:0] H_reg, H_next;
    reg [7:0] M_reg, M_next;
    reg [7:0] S_reg, S_next;
    reg pm_reg, pm_next;
 
    //state reg
    always @(posedge clk , posedge reset)
        begin
            if (reset)
                begin
                   H_reg <= 8'd6;
                   M_reg <= 8'd0;
                   S_reg <= 8'd0;
                   pm_reg <= 1'b0;
                end
            else if (ena)
                begin
                   H_reg <= H_next;
                   M_reg <= M_next;
                   S_reg <= S_next;
                   pm_reg <= pm_next;
                end
            else
                begin
                   H_reg <= H_reg;
                   M_reg <= M_reg;
                   S_reg <= S_reg;
                   pm_reg <= pm_reg;
                end
                
        end
 	//next state logic
always @(*)
        begin
            S_next = (S_reg == 8'd59) ? 8'd0 : S_reg + 1;
            M_next = (S_reg == 8'd59) ? ((M_reg == 8'd59) ? 8'd0 : M_reg + 1) : M_reg;
        
            if (S_reg == 8'd59 && M_reg == 8'd59) begin
                if (H_reg == 8'd12) begin
                    H_next = 8'd1; // Reset to 1 after 12 hours (12 -> 1)
                end
                else begin
                    H_next = H_reg + 1; 
                end
            end
            else begin
                H_next = H_reg; 
            end
        end
        
always @(*)
    begin
        if(S_reg == 8'd59 && M_reg == 8'd59 && H_reg == 8'd11 )
             pm_next = ~pm_reg;
         else
            pm_next = pm_reg;
    end

//output logic

assign   hh = H_reg;
assign   mm = M_reg;
assign   ss = S_reg;    
assign   pm = pm_reg;
 
endmodule
