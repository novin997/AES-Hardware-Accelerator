set ALL_IN_EX_CLOCK [remove_from_collection [all_inputs] [get_ports clk]]

#create a clock with given constrained clock period

create_clock -period 2 [get_ports clk]

#create input delay on all inputs except clock

set_input_delay -max 0.2 -clock clk $ALL_IN_EX_CLOCK

#create output delay on all outputs

set_output_delay -max 0.2 -clock clk [all_outputs]

#Set given load capacitance on all output pins
#Since Technology Library is Capacitive Load Unit : 1.000000ff

set_load 5 [all_outputs]

# Extra
# set_clock_uncertainty -setup 0.1 [get_clocks clk]
# set_driving_cell -lib_cell DFFX1_RVT -pin Q [all_inputs]
# set_load [expr [load_of saed32rvt_tt1p05v125c/INVX0_RVT/A] * 10] [all_outputs]
# set_max_area 200