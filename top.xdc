## SDIO interface
set_property PACKAGE_PIN E3 [get_ports {sdio_clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {sdio_clk}]

set_property PACKAGE_PIN F3 [get_ports {sdio_cmd}]
set_property IOSTANDARD LVCMOS33 [get_ports {sdio_cmd}]

set_property PACKAGE_PIN G2 [get_ports {sdio_data[0]}]
set_property PACKAGE_PIN H2 [get_ports {sdio_data[1]}]
set_property PACKAGE_PIN J1 [get_ports {sdio_data[2]}]
set_property PACKAGE_PIN K1 [get_ports {sdio_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sdio_data[*]}]

## RGB565 output
set_property PACKAGE_PIN P1 [get_ports {rgb_r[7]}]
set_property PACKAGE_PIN P2 [get_ports {rgb_r[6]}]
set_property PACKAGE_PIN P3 [get_ports {rgb_r[5]}]
set_property PACKAGE_PIN P4 [get_ports {rgb_r[4]}]
set_property PACKAGE_PIN P5 [get_ports {rgb_r[3]}]
set_property PACKAGE_PIN P6 [get_ports {rgb_r[2]}]
set_property PACKAGE_PIN P7 [get_ports {rgb_r[1]}]
set_property PACKAGE_PIN P8 [get_ports {rgb_r[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb_r[*]}]

set_property PACKAGE_PIN R1 [get_ports {rgb_g[7]}]
set_property PACKAGE_PIN R2 [get_ports {rgb_g[6]}]
set_property PACKAGE_PIN R3 [get_ports {rgb_g[5]}]
set_property PACKAGE_PIN R4 [get_ports {rgb_g[4]}]
set_property PACKAGE_PIN R5 [get_ports {rgb_g[3]}]
set_property PACKAGE_PIN R6 [get_ports {rgb_g[2]}]
set_property PACKAGE_PIN R7 [get_ports {rgb_g[1]}]
set_property PACKAGE_PIN R8 [get_ports {rgb_g[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb_g[*]}]

set_property PACKAGE_PIN T1 [get_ports {rgb_b[7]}]
set_property PACKAGE_PIN T2 [get_ports {rgb_b[6]}]
set_property PACKAGE_PIN T3 [get_ports {rgb_b[5]}]
set_property PACKAGE_PIN T4 [get_ports {rgb_b[4]}]
set_property PACKAGE_PIN T5 [get_ports {rgb_b[3]}]
set_property PACKAGE_PIN T6 [get_ports {rgb_b[2]}]
set_property PACKAGE_PIN T7 [get_ports {rgb_b[1]}]
set_property PACKAGE_PIN T8 [get_ports {rgb_b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb_b[*]}]

## Sync
set_property PACKAGE_PIN U1 [get_ports {rgb_hsync}]
set_property PACKAGE_PIN U2 [get_ports {rgb_vsync}]
set_property PACKAGE_PIN U3 [get_ports {rgb_de}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb_hsync}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb_vsync}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb_de}]

## Clock input
set_property PACKAGE_PIN W5 [get_ports {clk_pix}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk_pix}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_ports {clk_pix}]

## Reset
set_property PACKAGE_PIN V6 [get_ports {rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst}]
