setlocal
    \ tabstop=4
    \ shiftwidth=4
    \ softtabstop=4
    \ textwidth=80
    \ expandtab
    \ autoindent
    \ fileformat=unix
    \ number
setlocal omnifunc=python3complete#Complete
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
call SetPythonOptions()
