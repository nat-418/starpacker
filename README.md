# Starpacker

Tcl/Tk applications can be deployed as standalone executables called
Starpacks that bundle a Tcl interpreter, libraries, and application
files. It is also possible to “cross-compile” these Starpacks for various
systems and architecture runtimes.

This repository contains a simple Tcl script called `starpacker.tcl`,
as well as a `lib` directory with various runtimes and tools needed
to build Starpacks. It also contains a `dist` folder containing Starpacks
of the Starpacker application for x86_64 and ix86 Linux.

For cases where all you want to do is bundle together a single script file,
use `starscript.tcl`.

## Supported Platforms

Starpacker has been tested on Linux xand bundles Tcl 8.6 for the
following platforms:

* Linux x86_64
* Linux ix86
* Linux ARM
* macOS ix86 + x86_64
* macOS PowerPC + PowerPC64
* Windows ix86
* Windows x86_64

More runtimes (aka tclkits) [are avaialble](http://kitcreator.rkeene.org/kitcreator) for other platforms including Android, FreeBSD, etc. 

## Usage

Starpacker has a few commands to help build starpacks:

* `$ ./starpacker.tcl demo` creates an example project.
* `$ ./starpacker.tcl init $name` initializes an empty project `$name`.
* `$ ./starpacker.tcl build $name` packages a project `$name`.
* `$ ./starpacker.tcl clean` deletes auto-generated files.

## License

Starpacker is free software available under the 0BSD license.

