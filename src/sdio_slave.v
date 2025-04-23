module sdio_slave (
    input clk,
    input rst,

    input sdio_clk,
    input sdio_cmd,
    input [3:0] sdio_data,

    output reg [15:0] fb_data_out,
    output reg fb_wr_en,
    output reg [18:0] fb_addr
);
    reg [3:0] bit_cnt = 0;
    reg [15:0] shift_reg = 0;
    reg [18:0] addr = 0;

    always @(posedge sdio_clk) begin
        if (rst) begin
            addr <= 0;
            bit_cnt <= 0;
            shift_reg <= 0;
            fb_wr_en <= 0;
        end else begin
            shift_reg <= {shift_reg[11:0], sdio_data};
            bit_cnt <= bit_cnt + 4;

            if (bit_cnt == 12) begin
                fb_data_out <= shift_reg;
                fb_wr_en <= 1;
                fb_addr <= addr;
                addr <= addr + 1;
                bit_cnt <= 0;
            end else begin
                fb_wr_en <= 0;
            end
        end
    end
endmodule
