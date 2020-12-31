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
" Execution
" **************************
augroup PythonLangSettings
    au!
    au BufWrite *.py :Autoformat
    " au BufWrite *.py call yapf#YAPF()
    " au BufWrite *.py 0,$call yapf#YAPF()
    " au BufWrite *.py 0,$!yapf
augroup END



" **************************
" ALE config
" **************************
" Check Python files with flake8 and pylint.
let b:ale_linters = ['pylint']
" Fix Python files with autopep8
let b:ale_fixers = ['autopep8', 'add_blank_lines_for_python_control_statements',
            \ 'black', 'isort', 'remove_trailing_lines', 'trim_whitespace']
