module CLOCK_tb();

reg clk, reset, ena;
wire pm;
wire [7:0] hh;
wire [7:0] mm;
wire [7:0] ss;

CLOCK uut (
    .clk(clk),
    .reset(reset),
    .ena(ena),
    .pm(pm),
    .hh(hh),
    .mm(mm),
    .ss(ss)
);
localparam T = 10;

always 
begin
    clk <= 1'b0;
    #(T/10)
    clk <= 1'b1;
    #(T/10);
end

initial
begin 
reset = 1'b1;
ena = 1'b1;
#T
reset = 1'b0;

#(100000*T)
$stop;
end
endmodule

