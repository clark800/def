# def

`def` is a simple POSIX shell script that recursively searches source files in
the current directory for the definition of the given function name and prints
out all matching lines.

It can also be used to implement "go to definition" functionality for editors.
It does not require any database files like ctags and cscope.

#### Features

* If the current directory is a `git` directory, then any gitignored files
  and directories will be skipped.
* The following file extensions are recognized:
  c, h, py, js, ts, lua, awk, sh, rs, go.

#### Usage

`def [<name>] [<extension>]`

`def` will only search files with the specified file extension, which defaults
to `c`. With no arguments, `def` will list all function definitions.

#### Vim Integration

Copying `def.vim` into your vimrc will add a colon command `:D <name>` to search
for definitions in files with the same extension as the current file
(unless the current file is a `.h` file in which case it will search `.c` files)
and jump to the first definition found. Also, the F12 key will run this command
with the current name under the cursor. Additionally, the `:Dh <name>` command
and Shift+F12 work similarly, but always search `.h` files. If multiple
definitions are found, you can use `:lnext` to step through the results.

#### Caveats

* For C files, function prototypes will be listed in addition to definitions.
  This shouldn't be an issue if prototypes are in `.h` files since these are not
  normally searched. If there are prototypes in `.c` files, they can be indented
  by a space to make them not appear.
* Function definitions inside block comments will be listed if the comment
  starts on a prior line.
* Filenames and paths containing double quotes are not supported.
