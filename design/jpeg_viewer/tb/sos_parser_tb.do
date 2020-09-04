vlib work

vlog ../rtl/sos_parser.v

vlog sos_parser_tb.v
vsim -t ns -novopt work.sos_parser_tb

add wave -hex -position insertpoint  \
sim:/sos_parser_tb/r_arst \
sim:/sos_parser_tb/r_sysclk \
sim:/sos_parser_tb/r_byte_en \
sim:/sos_parser_tb/r_byte \
sim:/sos_parser_tb/r_ptr \
sim:/sos_parser_tb/w_byte \
sim:/sos_parser_tb/w_ready \
sim:/sos_parser_tb/r_re \
sim:/sos_parser_tb/w_start \
sim:/sos_parser_tb/w_scan_en \
sim:/sos_parser_tb/w_ecs_bit \
sim:/sos_parser_tb/inst_sos_parser/r_byte_1P \
sim:/sos_parser_tb/inst_sos_parser/r_cnt_1P \
sim:/sos_parser_tb/inst_sos_parser/r_jfif_status_1P
