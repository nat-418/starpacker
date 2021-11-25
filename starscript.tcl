#!/usr/bin/env tclsh
# Generate Kits here: http://kitcreator.rkeene.org/kitcreator

# Generate a Starpack from a single Tcl/Tk script.
proc starscript target {
    set name     [file root $target]
    set sdx      [file join lib sdx]
    set tclkit   [file join lib tclkit]
    set runtimes [glob [file join lib runtimes *]]

    file mkdir bin

    foreach runtime $runtimes {
        set os_arch [file tail $runtime]

        exec $tclkit $sdx qwrap $target -runtime $runtime

        file rename $name [file join bin $name-$os_arch]
    }
}

# Accept multiple scripts as input.
foreach target $argv {
    if {$target eq ""} {
        puts "Error: bad input '$target'."
        break
    } else {
        starscript $target
    }
}
