" DO NOT SET anything BASE ON FILETYPE.
" Because if you are here, you are for sure C++.

" Disable color_coded in diff mode

setlocal cindent comments=sr:/*,mb:*,el:*/,:// cino=)20,*30,g0
setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
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

" clang-tidy
let g:ale_cpp_clangtidy_executable = 'clang-tidy'
let g:ale_cpp_clangtidy_options = '-std=c++17'
" let g:ale_cpp_clangtidy_checks = ['abseil-*,boost-*,cppcoreguidelines-*,clang-analyzer-*,fuchsia-*,google-*,llvm-*,modernize-*,performance-*,portability-*,readability-*']
let g:ale_cpp_clangtidy_checks = ['cppcoreguidelines-*,google-*,llvm-*,modernize-*,performance-*,portability-*,readability-*']

" disable clang-check
let g:ale_cpp_clangcheck_executable = ''
let b:ale_linters = []
let g:ale_linters_ignore = {
      \   'cpp': ['clangcheck'],
      \}


" clangd
let g:ale_cpp_clangd_executable = 'clangd'
let g:ale_cpp_clangd_options = ["--clang-tidy --completion-style=detailed --fallback-style=google --header-insertion=iwyu --suggest-missing-includes"]

" clang-format
let g:ale_cpp_clangformat_executable = 'clang-format'
let g:ale_cpp_clangformat_use_local_file = 1


" **************************
" Mapping
" **************************
nmap <silent> <Leader>dq :Dox<cr>
nmap <silent> <Leader>dqb :DoxBlock<cr>

" aug CppDoxygenSettings
    " au!
    " autocmd FileType cpp,ch nmap <silent> <Leader>dq :Dox<cr>
    " autocmd FileType cpp,ch nmap <silent> <Leader>dqb :DoxBlock<cr>
" aug end
