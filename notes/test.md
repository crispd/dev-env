# Notes about using the `test` command
*see [wiki entry](https://en.wikipedia.org/wiki/Test_(Unix))*

## Use
Either:
 - `test <expression>` (i.e. `test -f is/this/thing/a/file`), or
 - `[ <expression> ]` (i.e. `[ -f is/this/thing/a/file ]`)

## Arguments
 - `-d <filename>`: returns true if filename is a directory
 - `-e <filename>`: returns true if filename exists
 - `-f <filename>`: returns true if filename is a regular file
 - `-h <filename>`: returns true if filename is a symbolic link


## Bracketing
Apparently, double brackets are newer and more convenient, but using single brackets make your script more portable.

##### TODO: Go through and replace double brackets with single brackets. Also check that the conditions are actually correct...
