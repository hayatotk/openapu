module rgb_out #(
    parameter H_ACTIVE = 800,
    parameter H_FP = 40,
    parameter H_SYNC = 48,
    parameter H_BP = 40,
    parameter V_ACTIVE = 480,
    parameter V_FP = 13,
    parameter V_SYNC = 3,
    parameter V_BP = 29
)(
    input wire clk, // pixel clock (e.g. 33.3 MHz for 800x480@60Hz)
    input wire rst,

    input wire [15:0] pixel_data,
    output reg [18:0] fb_addr,
    output reg hsync,
    output reg vsync,
    output reg de,
    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue
);

    reg [11:0] h_cnt = 0;
    reg [11:0] v_cnt = 0;

    wire [11:0] h_total = H_ACTIVE + H_FP + H_SYNC + H_BP;
    wire [11:0] v_total = V_ACTIVE + V_FP + V_SYNC + V_BP;

    always @(posedge clk) begin
        if (rst) begin
            h_cnt <= 0;
            v_cnt <= 0;
        end else begin
            if (h_cnt == h_total - 1) begin
                h_cnt <= 0;
                if (v_cnt == v_total - 1)
                    v_cnt <= 0;
                else
                    v_cnt <= v_cnt + 1;
            end else begin
                h_cnt <= h_cnt + 1;
            end
        end
    end

    // DE (Data Enable)
    always @(*) begin
        de = (h_cnt < H_ACTIVE) && (v_cnt < V_ACTIVE);
        hsync = (h_cnt >= H_ACTIVE + H_FP) && (h_cnt < H_ACTIVE + H_FP + H_SYNC);
        vsync = (v_cnt >= V_ACTIVE + V_FP) && (v_cnt < V_ACTIVE + V_FP + V_SYNC);
        fb_addr = v_cnt * H_ACTIVE + h_cnt;

        if (de) begin
            red   = {pixel_data[15:11], 3'b000};
            green = {pixel_data[10:5], 2'b00};
            blue  = {pixel_data[4:0], 3'b000};
        end else begin
            red = 0; green = 0; blue = 0;
        end
    end

endmodule
// Testbench for rgb_out module