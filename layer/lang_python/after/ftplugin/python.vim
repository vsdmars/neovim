setlocal omnifunc=python3complete#Complete

setlocal
    \ expandtab
    \ autoindent
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ foldmethod=indent
    \ fileformat=unix
    \ textwidth=120
    \ number

" setlocal textwidth=120


" gf to open files. replace . with /
setlocal includeexpr=substitute(v:fname,'\\.','/','g')

" **************************
" Function
" **************************
function! SetPythonOptions()
    " vim-codefmt
    autocmd FileType python AutoFormatBuffer yapf
endfunction

" **************************
" Execution
" **************************
" call SetPythonOptions()

augroup PythonLangSettings
    au!
    " au BufWrite *.py :Autoformat
    " au BufWrite *.py call yapf#YAPF()
    au BufWrite *.py 0,$call yapf#YAPF()
    " au BufWrite *.py 0,$!yapf

augroup END
