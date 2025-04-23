`timescale 1ns / 1ps

module test_tb;

    reg clk_pix = 0;
    reg rst = 1;

    reg sdio_clk = 0;
    reg [3:0] sdio_data = 0;
    reg sdio_cmd = 0;

    wire [7:0] rgb_r, rgb_g, rgb_b;
    wire rgb_hsync, rgb_vsync, rgb_de;

    // clock generation
    always #15 clk_pix = ~clk_pix;     // ~33.3 MHz
    always #10 sdio_clk = ~sdio_clk;   // ~50 MHz

    // instantiate top module
    top uut (
        .clk_pix(clk_pix),
        .rst(rst),
        .sdio_clk(sdio_clk),
        .sdio_cmd(sdio_cmd),
        .sdio_data(sdio_data),
        .rgb_r(rgb_r),
        .rgb_g(rgb_g),
        .rgb_b(rgb_b),
        .rgb_hsync(rgb_hsync),
        .rgb_vsync(rgb_vsync),
        .rgb_de(rgb_de)
    );

    initial begin
        // reset
        #100;
        rst = 0;

        // simulate frame write (SDIO push via data bus)
        // 16-bit RGB565 write: 0xF800 = red (5:6:5)
        #20;
        sdio_data = 4'hF; #20;
        sdio_data = 4'h8; #20;
        sdio_data = 4'h0; #20;
        sdio_data = 4'h0; #20;

        // let it render a few lines
        #20000;

        $display("done.");
        $stop;
    end

endmodule
