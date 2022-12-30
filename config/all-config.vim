" book reference: http://learnvimscriptthehardway.stevelosh.com/
" vimdoc: http://vimdoc.sourceforge.net/htmldoc/

" create a list of directories under $VIMHOME/layer
" if directory under layer starts with '_' will not be used.
" http://learnvimscriptthehardway.stevelosh.com/chapters/19.html
let &wig = "_*"  " set wig option to _*
let layers = globpath("~/.config/nvim/config", "*", 0, 1)
let &wig = ""  " clear wig option

" load vimscrip config
for l in layers
    " Load each layer's config
    let s:config = l . '/config.vim'

    if filereadable(s:config)
        exe "source" s:config
    endif
endfor
