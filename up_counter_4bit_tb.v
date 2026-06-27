module up_counter_4bit_tb;
	reg clk;
	reg reset;
	wire [3:0] count;

up_counter_4bit dut (.clk(clk),.reset(reset),.count(count));

always #5 clk <= ~clk;
initial begin
	clk = 0;
	$monitor("time = %0t | reset = %0b | count = %04b ",$time, reset, count);
	reset = 1; #10;
	reset = 0; #200;
	$finish;
end
initial begin
	$dumpfile("up_counter_4bit_dump.vcd");
	$dumpvars(0,up_counter_4bit_tb);
end
endmodule
