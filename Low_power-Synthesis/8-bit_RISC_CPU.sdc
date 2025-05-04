# Set the current design
current_design RISC_CPU
create_clock -name "clk" -add -period 1.350 -waveform {0.0 0.675} [get_ports clk]
set_input_delay -clock [get_clocks clk] -add_delay 0.675 [get_ports accumulator_register]
set_input_delay -clock [get_clocks clk] -add_delay 0.675 [get_ports is_zero]
set_output_delay -clock [get_clocks clk] -add_delay 0.675 [get_ports rst]
set_max_fanout 15.000 [current_design]
set_max_transition 1.2 [current_design]