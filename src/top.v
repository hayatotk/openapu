module top (
    input wire clk_pix,           // Pixel clock (e.g. 33.3 MHz)
    input wire rst,

    input wire sdio_clk,
    input wire sdio_cmd,
    input wire [3:0] sdio_data,

    output wire [7:0] rgb_r,
    output wire [7:0] rgb_g,
    output wire [7:0] rgb_b,
    output wire rgb_hsync,
    output wire rgb_vsync,
    output wire rgb_de
);

    wire [15:0] fb_data_out;
    wire fb_wr_en;
    wire [18:0] fb_addr_wr;

    wire [15:0] fb_pixel;
    wire [18:0] fb_addr_rd;

    // SDIO buffer
    // 16 bit per px, 800x480 = 384000 bit = 48000 bytes    
    sdio_slave sdio (
        .clk(sdio_clk),
        .rst(rst),
        .sdio_clk(sdio_clk),
        .sdio_cmd(sdio_cmd),
        .sdio_data(sdio_data),
        .fb_data_out(fb_data_out),
        .fb_wr_en(fb_wr_en),
        .fb_addr(fb_addr_wr)
    );

    // dual port RAM
    dual_port_ram #(
        .ADDR_WIDTH(19),
        .DATA_WIDTH(16)
    ) fb (
        .clk_a(sdio_clk),
        .addr_a(fb_addr_wr),
        .din_a(fb_data_out),
        .we_a(fb_wr_en),

        .clk_b(clk_pix),
        .addr_b(fb_addr_rd),
        .dout_b(fb_pixel)
    );

    // RGB generator w' sync signals
    rgb_out rgb (
        .clk(clk_pix),
        .rst(rst),
        .pixel_data(fb_pixel),
        .fb_addr(fb_addr_rd),
        .hsync(rgb_hsync),
        .vsync(rgb_vsync),
        .de(rgb_de),
        .red(rgb_r),
        .green(rgb_g),
        .blue(rgb_b)
    );

endmodule
