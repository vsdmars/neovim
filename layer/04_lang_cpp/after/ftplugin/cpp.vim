" DO NOT SET anything BASE ON FILETYPE.
" Because if you are here, you are for sure C++.

" Disable color_coded in diff mode

setlocal cindent comments=sr:/*,mb:*,el:*/,:// cino=)20,*30,g0
setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
            \ expandtab autoindent fileformat=unix number

if &diff
  let g:color_coded_enabled = 0
endif

let c_no_curly_error=1

" let g:clang_format#auto_format = 1
" let g:clang_format#code_style = "google"
" https://clang.llvm.org/docs/ClangFormatStyleOptions.html
" let g:clang_format#style_options = {
            " \ "AccessModifierOffset" : -4,
            " \ "AllowShortIfStatementsOnASingleLine" : "true",
            " \ "AllowShortFunctionsOnASingleLine": "Empty",
            " \ "AlwaysBreakTemplateDeclarations" : "true",
            " \ "BreakBeforeBraces" : "Stroustrup",
            " \ "BreakConstructorInitializersBeforeComma": "true",
            " \ "IndentCaseLabels": "true",
            " \ "IndentWidth": 4,
            " \ "MaxEmptyLinesToKeep": 2,
            " \ "NamespaceIndentation": "Inner",
            " \ "Standard" : "C++17",
            " \ "TabWidth": 4}

" https://github.com/w0rp/ale/blob/master/doc/ale-cpp.txt
" https://github.com/mapbox/cpp/issues/37
" https://news.ycombinator.com/item?id=15400396
" https://kristerw.blogspot.com/2017/09/useful-gcc-warning-options-not-enabled.html
" https://clang.llvm.org/docs/DiagnosticsReference.html
" -Wall
" -Wconversion
" -Wdouble-promotion
    " -Wduplicated-branches
    " -Wduplicated-cond
    " -Weffc++
    " -Wextra
    " -Wfloat-equal
    " -Wformat=2'
    " -Wjump-misses-init
    " -Wlogical-op
    " -Wno-error=unused-variable
    " -Wnull-dereference
    " -Wold-style-cast
    " -Wpedantic
    " -Wshadow
    " -Wuninitialized
    " -Wunreachable-code
    " -Wuseless-cast
let g:ale_cpp_cc_executable = "clang++"
let g:ale_cpp_cc_options = '-std=c++17 -Wall -Wconversion -Wdouble-promotion -Weffc++ -Wextra -Wfloat-equal -Wformat=2 -Wno-error=unused-variable -Wnull-dereference -Wold-style-cast -Wpedantic -Wshadow -Wuninitialized -Wunreachable-code -Wredundant-move -Wpessimizing-move'
let g:ale_cpp_clangtidy_options = '-std=c++17'
let g:ale_cpp_clangtidy_checks = ['abseil-*,boost-*,cppcoreguidelines-*,clang-analyzer-*,fuchsia-*,google-*,llvm-*,modernize-*,performance-*,portability-*,readability-*']
" disable clang-check
let g:ale_cpp_clangcheck_executable = ''
let g:ale_cpp_clangd_executable = 'clangd'
let g:ale_cpp_clangd_options = ["--clang-tidy --completion-style=detailed --fallback-style=google --header-insertion=iwyu --suggest-missing-includes"]

let g:ale_c_clangformat_executable = 'clang-format'
let g:ale_c_clangformat_options = []

let g:ale_c_clangtidy_checks = ""

" **************************
" Function
" **************************
" if executable('clangd')
    " augroup lsp_clangd
        " autocmd!
        " autocmd User lsp_setup call lsp#register_server({
                    " \ 'name': 'clangd',
                    " \ 'cmd': {server_info->['clangd']},
                    " \ 'whitelist': ['c', 'cpp'],
                    " \ })
        " setlocal omnifunc=lsp#complete
    " augroup end
" endif

" function! AppendCreate(var, val)
    " if exists(a:var)
        " let l:lst = split(eval(a:var), ',')
    " else
        " execute 'let' a:var '=""'
        " let l:lst = []
    " endif

    " let l:val = eval(a:val)
    " if index(l:lst, l:val) == -1
        " execute 'let' a:var '.=",".' a:val
    " endif
" endfunction



" **************************
" Mapping
" **************************
" ClangFormatAutoEnable is a cmd.
ClangFormatAutoEnable

" vim-operator-user
" https://github.com/kana/vim-operator-user
" needs to be installed as library.
map <silent> <buffer> <Leader>xf <Plug>(operator-clang-format)
nmap <silent> <Leader>dq :Dox<cr>
nmap <silent> <Leader>dqb :DoxBlock<cr>

" aug CppDoxygenSettings
    " au!
    " autocmd FileType cpp,ch nmap <silent> <Leader>dq :Dox<cr>
    " autocmd FileType cpp,ch nmap <silent> <Leader>dqb :DoxBlock<cr>
" aug end
