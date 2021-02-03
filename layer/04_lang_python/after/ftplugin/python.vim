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


let b:jedi#auto_initialization = 0
let b:jedi#completions_enabled = 0
let b:jedi#goto_command = "<leader>gd"
let b:jedi#popup_on_dot = 0
let b:jedi#popup_select_first = 0
let b:jedi#show_call_signatures = "1"

let b:formatters_python = ['black']
let b:autoformat_autoindent = 0
let b:autoformat_retab = 0
let b:autoformat_remove_trailing_spaces = 0
let b:python3_host_prog = "python3"
" let g:vim_isort_python_version = 'python3'
