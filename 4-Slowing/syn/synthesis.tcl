#enter the files to be analyzed
#elaborate top
read_verilog ../src/AddRndKey_top.v
read_verilog ../src/aes_sbox.v
read_verilog ../src/AES_top.v
read_verilog ../src/AEScntx.v
read_verilog ../src/AESCore.v
read_verilog ../src/KeySchedule_top.v
read_verilog ../src/matrix_mult.v
read_verilog ../src/MixCol_top.v
read_verilog ../src/shiftRows_top.v
read_verilog ../src/subBytes_top.v

#source constraint file

reset_design

current_design AES_top

check_design

link

source constraint.tcl

set_flatten true -minimize multiple_output -phase true
set_structure true

# compile the top module
# one approach is compiling with high effort
# the other is using compile_ultra which includes optimization such as retiming

# compile -map_effort high -incremental_mapping

compile_ultra -retime -timing_high_effort_script

redirect -tee AES.rpt {report_constraint -all_violators}

report_timing -delay max
report_timing -delay min

#report area

report_area

#report all registers in design

sizeof_coll [all_reg ]







