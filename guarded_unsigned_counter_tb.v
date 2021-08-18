/*
 * n bit unsigned counter with error detector Testbench
 * 
 * Can this part be used in spaceships in a place exposed to cosmic radiation? 
 * or in a location bothered by tons of grim electric shocking aliens? :)
 */

`timescale 1ns / 10ps

module guarded_unsigned_counter_tb;
    localparam width = 8;
    localparam guard_bits = 3;

    reg clk;
    reg rstn;
    wire [width - 1:0] out;

    /**
     * You can check this guard_bits on the other module.
     * ccounter output be compared with sum either even or odd.
     */
    wire [guard_bits - 1:0] even_bit;
    wire [guard_bits - 1:0] odd_bit;

    /* integer i;
    reg [width - 1] delay; */

    always #1 clk = ~clk;
    
    guarded_unsigned_counter #(
        .width (width),
        .guard_bits(guard_bits)
    ) COUNTER (
        .clk(clk),
        .rstn(rstn),
        .out(out),
        .even_bit(even_bit),
        .odd_bit(odd_bit)
    );

    initial begin
        $monitor("[%8t] out = %8b | even_bit = %4b | odd_bit = %4b", 
            $time, out, even_bit, odd_bit);
        
        $display("Initialize to 0.");

        clk <= 0;
        rstn <= 0;

        #10 rstn <= 1;
        $display("reset.");
        #30 rstn <= 0;
        #35 rstn <= 1;
        $display("reset.");
        // #40 rstn <= 0;

        /* for (i = 0; i < 256; i++) begin
            delay = $random;
            #(delay) rstn <= i;
        end */

        $dumpfile("guarded_unsigned_counter_tb.vcd");
        $dumpvars(0, guarded_unsigned_counter_tb); // all vars dump

        #512 $finish;
    end

endmodule
