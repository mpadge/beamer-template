# beamer-template

Beamer template with huge, very fancy fonts. Big images and huge fancy fonts can
take a long time to compile, so this is broken into individual `pdf` pieces to
be assembled by `pdftk` at the end. (This also allows ready insertion of `pdf`
pages within a `beamer` presentation.)

It's all run by `makefile`:

1. First open all files in `tmux` with `bash tmux-start.bash`
2. Then make figures with `$ make figs`
3. Then just `$ make` to make the whole lot
4. (Optional) `$ make clean`, `$ make cleanfigs`, or `$make cleanall`
