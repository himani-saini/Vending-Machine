`timescale 1ns / 1ps
`include "vending_machine.v"

module testbench;

//inputs
reg clk;
reg[1:0] in;
reg rst;

//output 
wire out;
wire[1:0] change;

vending_machine uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out),
    .change(change)
);

initial 
 begin
    //initialise inputs
    $dumpfile("vending_machine.vcd");
    $dumpvars(0,testbench);
    rst = 1;
    clk = 0;

    #6 rst = 0;
    in = 2;
    #19 in =2;
    #25 $finish;

 end 
 always #5 clk = ~clk;

 endmodule