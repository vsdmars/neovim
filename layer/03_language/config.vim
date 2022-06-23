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
\   'rust': ['rustfmt'],
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\ }

" let g:ale_linters = {
" \   'cpp': ['clangtidy'],
" \   'rust': ['analyzer']
" \ }

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
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

nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

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
   " call IncludeCR(0)
   call append(0, "#pragma once")
   " let basename = substitute(bufname(""), '.*/', '', '')
   " let guard = 'VSDMARS_' . substitute(toupper(basename), '\.', '_', "H")
   " call append(3, "")
   " call append(4, "#ifndef " . guard)
   " call append(5, "#define " . guard)
   " call append( line("$"), "#endif // for #ifndef " . guard)
endfun

fun! IncludeCR(type)
   if a:type == 0
      let l:guard0 = '/* ******************************'
      let l:guard1 = ' * Copyleft 2021 vsdmars'
      let l:guard2 = ' * ******************************/'
   elseif a:type == 1
      let l:guard0 = '# ******************************'
      let l:guard1 = '# Copyleft 2021 vsdmars'
      let l:guard2 = '# ******************************'
   endif
   call append(0, guard0)
   call append(1, guard1)
   call append(2, guard2)
endfun



" **************************
" Map related
" **************************
nmap <unique> <buffer> <leader>q :lnext<CR>
nmap <unique> <buffer> <leader>z :lprevious<CR>
nmap <unique> <buffer> <leader>w :cnext<CR>
nmap <unique> <buffer> <leader>x :cprevious<CR>
nmap <unique> <buffer> <leader>a :lclose<CR>
nmap <unique> <buffer> <leader>s :cclose<CR>

map <leader>g :call IncludeGuard()<CR>
" " ,c generates the copyleft info for c/c++
" map <leader>gc :call IncludeCR(0)<CR>
" " ,cm generates the copyleft info for cmake
" map <leader>gm :call IncludeCR(1)<CR>

" <Plug> meaning:
" https://stackoverflow.com/questions/18546533/execute-plug-commands-in-vim
" nnoremap <unique> <F7> :TaskList<CR>
nnoremap <unique> <silent> <F7> <Plug>TaskList
" nnoremap <unique> <silent> <F8> :TagbarToggle<CR>


" **************************
" CoC related
" https://github.com/neoclide/coc.nvim#example-vim-configuration
" https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file
"
" coc-settings.json schema:
" https://github.com/neoclide/coc.nvim/blob/master/data/schema.json
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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



" **************************
" Coclist plugin
" https://github.com/neoclide/coc-lists
" **************************
" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <leader><leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
vnoremap <leader><leader>g :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
nnoremap <leader><leader>g :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@
nnoremap <silent> <space>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>


" **************************
" Coc-HighLight plugin
" https://github.com/neoclide/coc-highlight
" **************************
autocmd CursorHold * silent call CocActionAsync('highlight')


" **************************
" Coc-Snippets plugin
" https://github.com/neoclide/coc-snippets
" **************************
" Use trigger snippet expand.
imap <c-l> <Plug>(coc-snippets-expand)

" Use select text for visual placeholder of snippet.
vmap <c-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <c-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


" **************************
" Coc-Yank plugin
" https://github.com/neoclide/coc-yank
" **************************
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>


" **************************
" coc auto completion setting
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources
" https://github.com/neoclide/coc-sources
" **************************
" Use command :CocList sources to get current completion source list.
" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" **************************
" coc-prettier setting
" **************************
" https://github.com/neoclide/coc-prettier
" Formatting selected code.
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" **************************
" coc-clangd setting
" https://github.com/clangd/coc-clangd
" **************************
" project setup: https://clangd.llvm.org/installation.html#project-setup
nmap <leader><leader>h  :CocCommand clangd.switchSourceHeader<CR>
nmap <leader><leader>s  :CocCommand clangd.symbolInfo<CR>


" **************************
" coc-github-users setting
" https://github.com/cb372/coc-github-users
" **************************
"
"
" **************************
" coc-db setting
" https://github.com/kristijanhusak/vim-dadbod-completion
" **************************


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
