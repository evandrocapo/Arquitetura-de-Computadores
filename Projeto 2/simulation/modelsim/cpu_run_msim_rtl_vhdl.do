transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Projeto 2/reg_instr.vhd}
vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Projeto 2/ula.vhd}
vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Projeto 2/banco_de_registradores.vhd}
vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Projeto 2/pc.vhd}
vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Projeto 2/uc.vhd}
vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Projeto 2/memoria_principal.vhd}
vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Projeto 2/cpu.vhd}
vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Projeto 2/cpu_tb.vhd}

vcom -93 -work work {C:/Users/Evandro/Desktop/Arquitetura-de-Computadores/Projeto 2/cpu_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  cpu_tb

add wave *
view structure
view signals
run -all
