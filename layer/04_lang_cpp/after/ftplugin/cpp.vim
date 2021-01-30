" DO NOT SET anything BASE ON FILETYPE.
" Because if you are here, you are for sure C++.

" Disable color_coded in diff mode

setlocal cindent comments=sr:/*,mb:*,el:*/,:// cino=)20,*30,g0
setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
            \ expandtab autoindent fileformat=unix number

if &diff
  let g:color_coded_enabled = 0
endif

let fsnonewfiles="on"
let c_no_curly_error=1

let g:clang_format#auto_format = 1
let g:clang_format#code_style = "llvm"
" https://clang.llvm.org/docs/ClangFormatStyleOptions.html
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AllowShortFunctionsOnASingleLine": "Empty",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BreakBeforeBraces" : "Stroustrup",
            \ "BreakConstructorInitializersBeforeComma": "true",
            \ "IndentCaseLabels": "true",
            \ "IndentWidth": 4,
            \ "MaxEmptyLinesToKeep": 2,
            \ "NamespaceIndentation": "Inner",
            \ "Standard" : "C++11",
            \ "TabWidth": 4}
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
let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wconversion -Wdouble-promotion -Weffc++ -Wextra -Wfloat-equal -Wformat=2 -Wno-error=unused-variable -Wnull-dereference -Wold-style-cast -Wpedantic -Wshadow -Wuninitialized -Wunreachable-code -Wredundant-move -Wpessimizing-move'
let g:ale_cpp_clangtidy_options = '-std=c++17'
let g:ale_cpp_clangtidy_checks = ['abseil-*,boost-*,cppcoreguidelines-*,clang-analyzer-*,fuchsia-*,google-*,llvm-*,modernize-*,performance-*,portability-*,readability-*']
" disable gcc
let g:ale_cpp_gcc_executable = ''
" disable clang-check
let g:ale_cpp_clangcheck_executable = ''



" **************************
" Function
" **************************
if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp'],
                    \ })
        setlocal omnifunc=lsp#complete
    augroup end
endif

function! AppendCreate(var, val)
    if exists(a:var)
        let l:lst = split(eval(a:var), ',')
    else
        execute 'let' a:var '=""'
        let l:lst = []
    endif

    let l:val = eval(a:val)
    if index(l:lst, l:val) == -1
        execute 'let' a:var '.=",".' a:val
    endif
endfunction



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
" Header guards on new .h files
" http://vim.wikia.com/wiki/Automatic_insertion_of_C/C%2B%2B_header_gates
nnoremap <buffer> <silent> <c-z> :FSHere<cr>
" switch to the file and load it into the current window
nnoremap <silent> <leader>of :FSHere<cr>
" in current window
nnoremap <silent> <leader>oo :FSHere<cr>
" in a new tab
nnoremap <silent> <leader>ot :call FSwitch('%', 'tabedit')<cr>
" in a new tab opened before this one
nnoremap <silent> <leader>oT :call FSwitch('%', "<c-r>=tabpagenr()-1<cr>tabedit")<cr>
" switch to the file and load it into the window on the right
nnoremap <silent> <leader>ol :FSRight<cr>
" switch to the file and load it into a new window split on the right
nnoremap <silent> <leader>oL :FSSplitRight<cr>
" switch to the file and load it into the window on the left
nnoremap <silent> <leader>oh :FSLeft<cr>
" switch to the file and load it into a new window split on the left
nnoremap <silent> <leader>oH :FSSplitLeft<cr>
" switch to the file and load it into the window above
nnoremap <silent> <leader>ok :FSAbove<cr>
" switch to the file and load it into a new window split above
nnoremap <silent> <leader>oK :FSSplitAbove<cr>
" switch to the file and load it into the window below
nnoremap <silent> <leader>oj :FSBelow<cr>
" switch to the file and load it into a new window split below
nnoremap <silent> <leader>oJ :FSSplitBelow<cr>



" autocommands to setup settings for different file types
augroup fswitchSettings
    autocmd!
    autocmd BufEnter,BufRead *.h call AppendCreate('b:fswitchdst', '"c"')
                              \ | call AppendCreate('b:fswitchdst', '"cc"')
                              \ | call AppendCreate('b:fswitchdst', '"cpp"')
                              \ | call AppendCreate('b:fswitchlocs', '"."')
    autocmd BufEnter,BufRead *.c,*.cc let b:fswitchdst = 'h'
                                   \ | let b:fswitchlocs = '.'
    autocmd BufEnter,BufRead *.hpp let b:fswitchdst = 'cpp'
                                \ | let b:fswitchlocs = '.'
    autocmd BufEnter,BufRead *.cpp let b:fswitchdst = 'hpp,h'
                                \ | let b:fswitchlocs = '.,../include'
    autocmd BufEnter,BufRead *.xaml let b:fswitchdst = 'xaml.cs'
                                 \ | let b:fswitchlocs = '.'
    autocmd BufEnter,BufRead *.xaml.cs let b:fswitchdst = 'xaml'
                                    \ | let b:fswitchfnames = '/\.xaml//'
                                    \ | let b:fswitchlocs = '.'
augroup end

" aug CppDoxygenSettings
    " au!
    " autocmd FileType cpp,ch nmap <silent> <Leader>dq :Dox<cr>
    " autocmd FileType cpp,ch nmap <silent> <Leader>dqb :DoxBlock<cr>
" aug end
