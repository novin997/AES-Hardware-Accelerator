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

#compile the top module

# compile_ultra
compile

report_constraint -all_violators

#report critical path

report_timing -delay max
report_timing -delay min

#report area

report_area

#report all registers in design

sizeof_coll [all_reg ]