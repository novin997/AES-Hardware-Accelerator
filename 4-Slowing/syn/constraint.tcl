set ALL_IN_EX_CLOCK [remove_from_collection [all_inputs] [get_ports clk]]

#create a clock with given constrained clock period

create_clock -period 1.0 [get_ports clk]

#create input delay on all inputs except clock

set_input_delay -max 0.1 -clock clk $ALL_IN_EX_CLOCK

#create output delay on all outputs

set_output_delay -max 0.1 -clock clk [all_outputs]

#Set given load capacitance on all output pins
#Since Technology Library is Capacitive Load Unit : 1.000000ff

set_load 5 [all_outputs]

#set false path for register to register timing

# set_disable_timing [get_pins AES_core/accept]
# set_disable_timing [get_ports cipher_text]
# set_disable_timing [get_ports done]