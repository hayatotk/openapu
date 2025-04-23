module dual_port_ram #(
    parameter ADDR_WIDTH = 19,
    parameter DATA_WIDTH = 16
)(
    input wire clk_a,
    input wire [ADDR_WIDTH-1:0] addr_a,
    input wire [DATA_WIDTH-1:0] din_a,
    input wire we_a,

    input wire clk_b,
    input wire [ADDR_WIDTH-1:0] addr_b,
    output reg [DATA_WIDTH-1:0] dout_b
);

    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

    always @(posedge clk_a)
        if (we_a)
            mem[addr_a] <= din_a;

    always @(posedge clk_b)
        dout_b <= mem[addr_b];

endmodule
