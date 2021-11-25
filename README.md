# Starpacker

Tcl/Tk applications can be deployed as standalone executables called
Starpacks that bundle a Tcl interpreter, libraries, and application
files. It is also possible to “cross-compile” these Starpacks for various
systems and architecture runtimes.

This repository contains a simple Tcl script called `starpacker.tcl`,
as well as a `lib` directory with various runtimes and tools needed
to build Starpacks. It also contains a `dist` folder containing Starpacks
of the Starpacker application for 64 and 32-bit Linux.

## Usage

Starpacker has a few commands to help build starpacks:

* `$ ./starpacker.tcl demo` creates an example project.
* `$ ./starpacker.tcl init $name` initializes an empty project `$name`.
* `$ ./starpacker.tcl build $name` makes Starpackes for a proejct `$name`.
* `$ ./starpacker.tcl clean` deletes auto-generated files.

## License

Starpacker is free software available under the 0BSD license.
