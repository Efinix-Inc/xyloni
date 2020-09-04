vlib work

vlog ../rtl/rgb_to_cmyk.v
vlog ../../../ip/mult.v

vlog rgb_to_cmyk_tb.v
vsim -t ns -novopt work.rgb_to_cmyk_tb
