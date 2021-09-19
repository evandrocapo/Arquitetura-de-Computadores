transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Aula 5/alu/full_adder.vhd}
vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Aula 5/alu/ripple_carry.vhd}
vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Aula 5/alu/alu.vhd}

vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Aula 5/alu/alu_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
