/*
 * n bit unsigned counter with error detector
 *
 * when counter ouput width 2 ^ n bits,
 * then even or odd bit counted each bit on 1 are max n bits + 1.
 *
 *    1111 1111 -> counted integer 8, binary number is 1000.
 *
 * so, 2 ^ n bit counter, guard_bits n + 1
 * we can check roughly by downsize the guard_bits.
 *
 * Can this part be used in spaceships in a place exposed to cosmic radiation? 
 * or in a location bothered by tons of grim electric shocking aliens? :)
 */

`timescale 1ns/10ps

module guarded_unsigned_counter # (
    parameter width = 8,
    parameter guard_bits = 4
) (
        input   clk,
        input   rstn,

        output  reg [width - 1:0]       out,
        output  reg [guard_bits - 1:0]  even_bit,
                                        odd_bit
);

    integer i;

    reg [guard_bits - 1: 0] odd_cnt = 0, even_cnt = 0;

    always @ (posedge clk) begin
        if (!rstn) begin
            out <= out + 1;
        end else
            out <= 0;
    end

    always @ (posedge clk) begin
        if (!rstn) begin
            for (i = 1; i < width; i = i + 2) begin
                if (out[i])
                    odd_cnt++;
            end

            odd_bit = odd_cnt;
        end else begin
            odd_bit <= 0;
        end
    end

    always @ (posedge clk) begin
        if (!rstn) begin
            for (i = 0; i < width; i = i + 2) begin
                if (out[i])
                    even_cnt++;
            end

            even_bit = even_cnt;
        end else begin
            even_bit <= 0;
        end
    end

endmodule
