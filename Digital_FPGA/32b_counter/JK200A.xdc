# Clock Signal
set_property PACKAGE_PIN D4 [get_ports i_clk]
set_property IOSTANDARD LVCMOS33 [get_ports i_clk]

# Input Keys
set_property PACKAGE_PIN H14 [get_ports i_key1_mode]
set_property IOSTANDARD LVCMOS33 [get_ports i_key1_mode]

set_property PACKAGE_PIN H13 [get_ports i_key2_clear]
set_property IOSTANDARD LVCMOS33 [get_ports i_key2_clear]

# Reset Signal
set_property PACKAGE_PIN D3 [get_ports i_rstn]
set_property IOSTANDARD LVCMOS33 [get_ports i_rstn]

# Rotary Switch Inputs
set_property PACKAGE_PIN F12 [get_ports {i_rotary[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_rotary[3]}]

set_property PACKAGE_PIN J16 [get_ports {i_rotary[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_rotary[2]}]

set_property PACKAGE_PIN H12 [get_ports {i_rotary[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_rotary[1]}]

set_property PACKAGE_PIN J15 [get_ports {i_rotary[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_rotary[0]}]

# Output LEDs
set_property PACKAGE_PIN D14 [get_ports {o_led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_led[7]}]

set_property PACKAGE_PIN C14 [get_ports {o_led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_led[6]}]

set_property PACKAGE_PIN E13 [get_ports {o_led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_led[5]}]

set_property PACKAGE_PIN E12 [get_ports {o_led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_led[4]}]

set_property PACKAGE_PIN F14 [get_ports {o_led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_led[3]}]

set_property PACKAGE_PIN F13 [get_ports {o_led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_led[2]}]

set_property PACKAGE_PIN G14 [get_ports {o_led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_led[1]}]

set_property PACKAGE_PIN G12 [get_ports {o_led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_led[0]}]

# Additional LEDs
set_property PACKAGE_PIN C16 [get_ports {o_kled[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_kled[3]}]

set_property PACKAGE_PIN F15 [get_ports {o_kled[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_kled[2]}]

set_property PACKAGE_PIN H16 [get_ports {o_kled[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_kled[1]}]

set_property PACKAGE_PIN C13 [get_ports {o_kled[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_kled[0]}]

# Additional TLEDs
set_property PACKAGE_PIN C9 [get_ports {o_tled[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_tled[3]}]

set_property PACKAGE_PIN D9 [get_ports {o_tled[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_tled[2]}]

set_property PACKAGE_PIN D10 [get_ports {o_tled[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_tled[1]}]

set_property PACKAGE_PIN C11 [get_ports {o_tled[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_tled[0]}]