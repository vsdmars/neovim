" **************************
" Language pack related
" **************************


" **************************
" ALE related
" https://github.com/dense-analysis/ale/blob/master/doc/ale-cpp.txt
" https://github.com/dense-analysis/ale/blob/master/doc/ale-c.txt
" **************************
" https://github.com/dense-analysis/ale#usage-linting
" below setting will enable C-x, C-o completion
" set omnifunc=ale#completion#OmniFunc
" set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 0
let g:ale_list_window_size = 5
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'cpp': ['clang-format'],
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\ }

let g:ale_linters = {
\   'cpp': ['clangtidy'],
\ }

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_delay = 500
" let g:ale-lint-file
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
" open location list or quick fix window if there's error
let g:ale_open_list = 0
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 0
" debug with :ALEInfo
" let g:ale_history_log_output = 1
" https://stackoverflow.com/a/20934608
let g:ale_set_loclist = 1  " local to window
let g:ale_set_quickfix = 0  " global

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_column_always = 0
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_sign_error = '✗ '
let g:ale_sign_warning = '⚠ '
let g:ale_sign_priority = 100

nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

" https://github.com/majutsushi/tagbar
" set focus to TagBar when opening it
" let g:tagbar_autofocus = 0

" https://github.com/Yggdroot/indentLine
let g:indentLine_enabled = 1
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'calendar', 'thumbnail', 'tweetvim']


" **************************
" Map related
" **************************
nmap <unique> <buffer> <leader>q :lnext<CR>
nmap <unique> <buffer> <leader>z :lprevious<CR>
nmap <unique> <buffer> <leader>w :cnext<CR>
nmap <unique> <buffer> <leader>x :cprevious<CR>
nmap <unique> <buffer> <leader>a :lclose<CR>
nmap <unique> <buffer> <leader>s :cclose<CR>

" <Plug> meaning:
" https://stackoverflow.com/questions/18546533/execute-plug-commands-in-vim
" nnoremap <unique> <F7> :TaskList<CR>
nnoremap <unique> <silent> <F7> <Plug>TaskList
" nnoremap <unique> <silent> <F8> :TagbarToggle<CR>


" **************************
" Global Settings
" **************************
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif



" **************************
" Browsing setting
" **************************
let g:openbrowser_search_engines = extend(
\ get(g:, 'openbrowser_search_engines', {}),
\ {
\   'cppreference': 'https://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search={query}',
\   'qt': 'https://doc.qt.io/qt-5/search-results.html?q={query}',
\ },
\ 'keep'
\)

nnoremap <silent> <leader>osx :call openbrowser#smart_search(expand('<cword>'), "cppreference")<CR>
nnoremap <silent> <leader>osq :call openbrowser#smart_search(expand('<cword>'), "qt")<CR>
