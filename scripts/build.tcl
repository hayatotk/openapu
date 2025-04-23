# usage: build.tcl <project> <top> <device> <srcdir> <xdc> <outdir>

set project [lindex $argv 0]
set top     [lindex $argv 1]
set device  [lindex $argv 2]
set srcdir  [lindex $argv 3]
set xdc     [lindex $argv 4]
set outdir  [lindex $argv 5]

create_project $project $outdir -part $device -force
set_property top $top [current_fileset]

# добавить все .v
foreach file [glob -nocomplain -directory $srcdir *.v] {
    add_files $file
}

# constraints
add_files -fileset constrs_1 $xdc

update_compile_order -fileset sources_1
launch_runs synth_1 -jobs 4
wait_on_run synth_1

launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
