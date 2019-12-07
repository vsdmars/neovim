" **************************
" Setting
" **************************
set autoindent smartindent
set backspace=indent,eol,start
set nomodeline

" Work nicely with the system clipboard
" set clipboard=unnamedplus
" Number formats, for incrementing
set nrformats=alpha,octal,hex

" Use a short timeout for incomplete mappings
set ttimeout
set ttimeoutlen=100

" Highlight the current line
set cursorline

" Delete comment character(s) when joining commented lines
set formatoptions+=j

" Indent Guides
" http://goo.gl/qfF9od
" http://www.vim.org/scripts/script.php?script_id=3361
let g:indent_guides_guide_size = 1
setlocal colorcolumn=120
hi ColorColumn ctermbg=lightblue guibg=blue

" https://github.com/matze/vim-move
let g:move_key_modifier = 'A'

" Search while typing
set incsearch

" Ignore case (but be smart)
set ignorecase
set smartcase

" Ignore certain patterns while searching
set wildignore+=target,out,build_debug,build_release,build
set wildignore+=Library,*.csproject,*.meta
set wildignore+=_site,vendor,node_modules
set wildignore+=*.o,*.d,*.a,*.c3b,*.ccz,Resource,*.jar,*.strings,*.plist,*.filters
set wildignore+=*.xcscheme,*.xcworkspacedata,*.xcscmblueprint,*.properties,*.keystore
set wildignore+=boost_*,googletest,*.proto,protobuf,*.txt,Frameworks,*.framework
set wildignore+=*.vcxitems,*.xib,*.nib,*.pbxproj,*.xcuserstate,*.props
set wildignore+=*.apk,*.iml
set wildignore+=*.ogg,*.wav,*.mp3,*.mid,*.png,*.jpg,*.jpeg

" https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_map = ',cp'
let g:ctrlp_working_path_mode = 'rw'
" Don't limit results as much
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 100
" Allow easy opening of multiple files in tabs
let g:ctrlp_open_multiple_files = 't'
" Follow symlinks, but don't loop
let g:ctrlp_follow_symlinks = 1
" Only update after typing has stopped for some ms
let g:ctrlp_lazy_update = 250
" Use a faster matcher for CtrlP
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s; git ls-files . -co --exclude-standard; for submodule in $(git submodule status | sed "s/[ +]\S\+ \(\S\+\).*/\1/"); do cd "$submodule"; git ls-files . -co --exclude-standard | sed "s#^#$submodule/#"; cd "$OLDPWD"; done', 'find %s -type f']
" Keep file cache between sessions
let g:ctrlp_clear_cache_on_exit = 0

" https://github.com/mileszs/ack.vim
let g:ackprg = 'ag --vimgrep'
" Don't jump to first result
cnoreabbrev Ag Ack!
let g:ackhighlight = 0
" Disable terminal output of ag as it runs
set shellpipe=>

" https://github.com/thaerkh/vim-workspace
let g:workspace_session_name = '.session.vim'
let g:workspace_undodir = '.vimundo'
let g:workspace_persist_undo_history = 1
let g:workspace_autosave_untrailspaces = 0

" https://github.com/vim-scripts/restore_view.vim
let g:skipview_files = ['*\.vim']
set viewoptions=cursor,folds,slash,unix

" https://github.com/ntpeters/vim-better-whitespace
let g:better_whitespace_ctermcolor = 'red'
let g:better_whitespace_enabled = 1
" let ale plugin do the trim
let g:strip_whitespace_on_save = 0

" https://github.com/scrooloose/nerdtree
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1

" https://github.com/rbgrouleff/bclose.vim
let g:bclose_no_plugin_maps = 1
let g:no_plugin_maps = 1

" **************************
" Function
" **************************
function! SetColorColumn()
    " let col_num = virtcol(".")
    let col_num = 120
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

" Jump to location
" http://vim.wikia.com/wiki/Jumping_to_previously_visited_locations
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

function! ResCur()
  if line("'\"") <= line("$") && !&diff
    normal! g`"
    return 1
  endif
endfunction

" Make the proper directories when writing a file
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

"Auto set workdir root
function! s:setcwd()
    let cph = expand('%:p:h', 1)
    if cph =~ '^.\+://' | retu | en
    for mkr in ['.git/', '.hg/', '.svn/', '.bzr/', '_darcs/', '.vimprojects']
      let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
      if wd != '' | let &acd = 0 | brea | en
    endfo
    exe 'lc!' fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
endfunction



" **************************
" Execution
" **************************
" Persist undo history.
if !isdirectory($HOME . "/.vim-undo")
  call mkdir($HOME . "/.vim-undo", "", 0700)
endif



" **************************
" Command
" **************************
" Allow opening multiple files at once
com! -complete=file -nargs=* E silent! exec "!vim --servername "
            \ . v:servername . " --remote-tab-silent <args>"

" Allow saving as root
command! Wsudo w !sudo tee % > /dev/null

" Common typos
command! W w
command! Wa wa
command! Wq wq
command! Wqa wqa



" **************************
" Mapping
" **************************
noremap <leader>ch :call SetColorColumn()<CR>
" --- move around splits
" move to and maximize the below split
" noremap <C-J> <C-W>j<C-W>_
" move to and maximize the above split
" noremap <C-K> <C-W>k<C-W>_
" move to and maximize the left split
" nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split
" nmap <c-l> <c-w>l<c-w><bar>
" set wmw=0 " set the min width of a window to 0 so we can maximize others
" set wmh=0 " set the min height of a window to 0 so we can maximize others

" move around tabs. conflict with the original screen top/bottom
"comment them out if you want the original H/L
"go to prev tab
nnoremap <C-t><C-n> gT
"go to next tab
nnoremap <C-t><C-p> gt
" new tab
nnoremap <C-t><C-t> :tabnew<CR>
" close tab
nnoremap <C-t><C-w> :tabclose<CR>

" http://superuser.com/questions/410982/in-vim-how-can-i-quickly-switch-between-tabs
" Go to tab by number
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>
" nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

nnoremap <silent> <A-Left> :tabm - 1<CR>
nnoremap <silent> <A-Right> :tabm + 1<CR>

" Go to file in a new tab
nnoremap gF <C-W>gF

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" ,pp toggles paste mode
" set paste
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cnoremap <silent> cd. lcd %:p:h
" nnoremap ,cd :cd %:p:h<CR>
" nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Move to next new line instead of enter insert mode
noremap <S-Enter> O<Esc>
noremap <CR> o<Esc>

" Show line number
nnoremap <silent> <leader>N :set number!<CR>

" Taggle Read Only
nnoremap <leader>ro :set ro!<CR>

" Show full path file name
nnoremap <C-h> :echo expand('%:p')<CR>

nnoremap <leader>j :call GotoJump()<CR>

" copy current file location into clipboard
nnoremap <leader>f :let @+ = expand("%:p")<cr>

" reference: https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim
" Delete lines without adding them to the yank stack
" the following mappings will produce:
" d => "delete"
" leader d => "cut"
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

" yank from current cursor postion to the end
nnoremap Y y$

" Move based on display lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Try not to use escape to go back to normal mode under insert mode, duh~~
inoremap jk <Esc>
inoremap kj <Esc>

" https://github.com/bkad/CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
nnoremap <leader>S :ToggleWorkspace<CR>

" https://github.com/mileszs/ack.vim
nnoremap <C-f> :Ack!
" Count word occurrences in a file
map ,* *<C-O>:%s///gn<CR>

" https://github.com/scrooloose/nerdtree
map <C-Z> :set go-=L \| set go+=l \| NERDTreeToggle<CR>

" https://github.com/mbbill/undotree
nnoremap <F6> :UndotreeToggle<cr>

aug GlobalEditingSettings
    au!
    autocmd BufWinEnter * call ResCur()
    " auto change local windows directory to current file directory
    " http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
    autocmd BufEnter * silent! lcd %:p:h
    autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    " this will set .git as root director
    " autocmd BufEnter * call s:setcwd()
aug end

" make FZF respect gitignore if `ag` is installed
" you will obviously need to install `ag` for this to work
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif



" **************************
" Snippet Setting
" **************************
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets' behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
" if has('conceal')
  " set conceallevel=2 concealcursor=niv
" endif

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1

" Expand the completed snippet trigger by <CR>.
" imap <expr><CR>
" \ (pumvisible() && neosnippet#expandable()) ?
" \ "\<Plug>(neosnippet_expand)" : "\<CR>"

" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'
