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


" **************************
" Commands Settings
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
noremap <C-Enter> O<Esc>
noremap <CR> o<Esc>


" Show line number
nnoremap <silent> <leader>N :set number!<CR>

" Taggle Read Only
nnoremap <leader>ro :set ro!<CR>

" Show full path file name
nnoremap <leader>pp :echo expand('%:p')<CR>

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
nnoremap <leader>dd ""d
nnoremap <leader>DD ""D

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

" COMMANDS				      MODES
"                                           Visual    Select
" :vmap  :vnoremap  :vunmap  :vmapclear	    yes      yes
" :xmap  :xnoremap  :xunmap  :xmapclear	    yes       -
" :smap  :snoremap  :sunmap  :smapclear	    -	     yes
sunmap w
sunmap b
sunmap e
sunmap ge
