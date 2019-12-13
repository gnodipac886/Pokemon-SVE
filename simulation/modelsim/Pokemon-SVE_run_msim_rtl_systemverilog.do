transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Eric/Desktop/Pokemon-SVE {C:/Users/Eric/Desktop/Pokemon-SVE/gymTileLogic.sv}
vlog -sv -work work +incdir+C:/Users/Eric/Desktop/Pokemon-SVE {C:/Users/Eric/Desktop/Pokemon-SVE/gymBoundsChecker.sv}
vlog -sv -work work +incdir+C:/Users/Eric/Desktop/Pokemon-SVE {C:/Users/Eric/Desktop/Pokemon-SVE/framebuffer.sv}
vlog -sv -work work +incdir+C:/Users/Eric/Desktop/Pokemon-SVE {C:/Users/Eric/Desktop/Pokemon-SVE/VGA_controller.sv}
vlog -sv -work work +incdir+C:/Users/Eric/Desktop/Pokemon-SVE {C:/Users/Eric/Desktop/Pokemon-SVE/testmodule.sv}
vlib lab8_soc
vmap lab8_soc lab8_soc

vlog -sv -work work +incdir+C:/Users/Eric/Desktop/Pokemon-SVE {C:/Users/Eric/Desktop/Pokemon-SVE/testbench_pokemon.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -L lab8_soc -voptargs="+acc"  testbench_pokemon

add wave *
view structure
view signals
run 2000 ns
