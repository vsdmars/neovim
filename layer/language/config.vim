" **************************
" Setting related
" **************************
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
set cot-=preview "disable doc preview in omnicomplete
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=10

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
let g:ale_lint_delay = 500
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
let g:ale_sign_error = '✗ '
let g:ale_sign_warning = '⚠ '
let g:ale_sign_priority = 100

" https://github.com/majutsushi/tagbar
" set focus to TagBar when opening it
let g:tagbar_autofocus = 0

" https://github.com/Yggdroot/indentLine
let g:indentLine_enabled = 1
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'calendar', 'thumbnail', 'tweetvim']



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



" **************************
" CoC related
" **************************
set hidden

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
inoremap <silent><expr> <a-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



" **************************
" coc-git setting
" **************************
" https://github.com/neoclide/coc-git



" **************************
" coc-snippets setting
" **************************
" Default coc schema
" https://github.com/neoclide/coc.nvim/blob/master/data/schema.json
" Wiki
" https://github.com/neoclide/coc.nvim/wiki

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Causing python autocomplete select off 1 index.
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:coc_snippet_next = '<tab>'



" **************************
" coc-highlight
" **************************
autocmd CursorHold * silent call CocActionAsync('highlight')
