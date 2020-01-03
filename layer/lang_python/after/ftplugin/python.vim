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
" call SetPythonOptions()

augroup PythonLangSettings
    au!
    au BufWrite *.py :Autoformat

    au BufNewFile,BufRead *.py
        \ set expandtab       |" replace tabs with spaces
        \ set autoindent      |" copy indent when starting a new line
        \ set tabstop=4
        \ set softtabstop=4
        \ set shiftwidth=4
        \ set foldmethod=indent
        \ set textwidth=120
        \ set fileformat=unix
        \ set number

    au BufNewFile,BufRead *.py \
augroup END
