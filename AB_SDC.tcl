#for block A
create_clock -name CLK1 2 [get_pins PLL1/CK1]
create_generated_clock -divide_by 6 -source CLK1 [get_pins foo1] set_clock_uncertainty 0.1 [get_clocks CLK1]
set_driving_cell –cell [get_lib_cells LIB/BUF2] -pin X [get_ports IO1 ] set_output_delay -max 5.05 -clock CLK1 [get_ports IO4]
set_output_delay -max 4.05 -clock CLK1 [get_ports IO9]
#for block B
create_clock -name CLK1 8 [get_pins PLL2/CK2]
create_generated_clock -divide_by 14 -source CLK2 [get_pins foo2] set_clock_uncertainty 0.1 [get_clocks CLK2]
set_input_delay -max 7-clock CLK1 [get_ports IO5]
set_input_delay -max 6-clock CLK1 [get_ports IO10]
set_load 0.01 [get_ports IO11]
set_false_path -from [get_clocks CLK1] -to [get_clocks CLK2]