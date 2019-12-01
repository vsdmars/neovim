" **************************
" Setting related
" **************************
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
set cot-=preview "disable doc preview in omnicomplete
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15

" https://github.com/dense-analysis/ale#usage-linting

" below setting will enable C-x, C-o completion
" set omnifunc=ale#completion#OmniFunc
" set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 0
let g:ale_list_window_size = 5
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\ }
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000
" let g:ale-lint-file
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_open_list = 1
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
let g:ale_sign_error = '✗\ '
let g:ale_sign_warning = '⚠\ '
let g:ale_sign_priority = 100

" https://github.com/majutsushi/tagbar
" set focus to TagBar when opening it
let g:tagbar_autofocus = 0

" https://github.com/Yggdroot/indentLine
let g:indentLine_enabled = 1
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'calendar', 'thumbnail', 'tweetvim']

" https://stackoverflow.com/questions/24100896/vim-go-autocompletion-not-working
" check who last updated omnifunc(vim-go is responsible for last update the setting):
" :verbose setlocal omnifunc?

" https://github.com/Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('sources', {
    \ '_': ['buffer'],
    \ 'go': ['vim-go'],
\})

call deoplete#custom#option('omni_patterns', {
    \ 'go': '[^. *\t]\.\w*',
\})

call deoplete#custom#option({
    \ 'auto_complete': v:true,
    \ 'auto_complete_delay': 10,
    \ 'camel_case': v:true,
    \ 'smart_case': v:true,
    \ })

" do not use ale for auto completion due to vim-go uses gopls by default.
" call deoplete#custom#source('ale', 'dup', v:true)

" **************************
" Function related
" **************************
fun! IncludeGuard()
   call IncludeCR(0)
   " call append(4, "#pragma once")
   let basename = substitute(bufname(""), '.*/', '', '')
   let guard = 'VSDMARS_' . substitute(toupper(basename), '\.', '_', "H")
   call append(3, "")
   call append(4, "#ifndef " . guard)
   call append(5, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun

fun! IncludeCR(type)
   if a:type == 0
      let l:guard0 = '/* ******************************'
      let l:guard1 = ' * Copyleft 2018 Verbalsaint'
      let l:guard2 = ' * ******************************/'
   elseif a:type == 1
      let l:guard0 = '# ******************************'
      let l:guard1 = '# Copyleft 2018 Verbalsaint'
      let l:guard2 = '# ******************************'
   endif
   call append(0, guard0)
   call append(1, guard1)
   call append(2, guard2)
endfun



" **************************
" Map related
" **************************
nmap <buffer> <leader>q :lnext<CR>
nmap <buffer> <leader>z :lprevious<CR>
nmap <buffer> <leader>w :cnext<CR>
nmap <buffer> <leader>x :cprevious<CR>
nmap <buffer> <leader>a :lclose<CR>
nmap <buffer> <leader>s :cclose<CR>

" nmap <silent> <m-k> <Plug>(ale_previous_wrap)
" nmap <silent> <m-j> <Plug>(ale_next_wrap)
" map <leader>g :call IncludeGuard()<CR>
" ,c generates the copyleft info for c/c++
" map <leader>gc :call IncludeCR(0)<CR>
" ,cm generates the copyleft info for cmake
" map <leader>gm :call IncludeCR(1)<CR>
nnoremap <unique> <F7> <Plug>TaskList
nnoremap <unique> <F8> :TagbarToggle<CR>
