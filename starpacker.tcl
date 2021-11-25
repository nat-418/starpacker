#!/usr/bin/env tclsh
package require Tcl 8.6

set version 0.1.0

variable system_tclkit [file join lib "tclkit-8.6.3-linux-x86_64"]

proc clean {} {
    file delete ./bin
    file mkdir  ./bin
}

proc init name {
    if {[file isdirectory $name.vfs]} {
        puts stderr "Error: '$name.vfs' already exists."
        exit 1
    }

    file mkdir $name.vfs/lib

    close [open [file join $name.vfs main.tcl] a]
}

proc build name {
    variable system_tclkit
    set runtimes [glob [file join lib runtimes *]]
    set sdx      [file join lib sdx.kit]
    
    if {![file isdirectory $name.vfs]} {
        puts stderr "Error: '$name.vfs' does not exist."
        exit 1
    }

    foreach runtime $runtimes {
        set runtail [file tail $runtime]

        exec $system_tclkit $sdx wrap $name -runtime $runtime

        file mkdir bin
        file rename -force $name [file join bin "$name-$runtail"]
    }
}

proc demo {} {
    init demo

    set main [open [file join demo.vfs main.tcl] w]
    puts $main {puts "Hello, world!"}
    close $main

    build demo
}

lassign $argv command name

switch $command {
    "build" {build $name}
    "clean" {clean}
    "demo"  {demo}
    "init"  {init  $name}
    default {
        puts stderr "Error: bad input."
        exit 1
    }
}
