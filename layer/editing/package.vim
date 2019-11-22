" **************************
" Editing related
" **************************
" normal mode / visual mode
" start: <C-n> start multicursor and add a virtual cursor + selection on the match
" next: <C-n> add a new virtual cursor + selection on the next match
" skip: <C-x> skip the next match
" prev: <C-p> remove current virtual cursor + selection and go back on previous match
" select all: <A-n> start muticursor and directly select all matches
" You can now change the virtual cursors + selection with visual mode commands.
" For instance: c, s, I, A work without any issues.
" You could also go to normal mode by pressing v and use normal commands there.
" At any time, you can press <Esc> to exit back to regular Vim.
" NOTE: start with g<C-n> to match without boundaries (behaves like g* instead of *)
" visual mode when multiple lines are selected
" start: <C-n> add virtual cursors on each line
" You can now change the virtual cursors with normal mode commands.
" For instance: ciw.
" command
" The command MultipleCursorsFind accepts a range and a pattern (regexp), it creates a visual cursor at the end of each match.
" If no range is passed in, then it defaults to the entire buffer.
" https://github.com/terryma/vim-multiple-cursors
" $ vip
Plug 'terryma/vim-multiple-cursors'



" **************************
" File manager related
" **************************
" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'



" **************************
" Code commenter related
" **************************
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'



" **************************
" Buffer related
" **************************
Plug 'vim-scripts/BufOnly.vim'
Plug 'rbgrouleff/bclose.vim'


" **************************
" Editing related
" **************************
Plug 'bogado/file-line'
" all trailing whitespace to be highlighted.
" https://github.com/ntpeters/vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'



" **************************
" Motion related
" **************************
" https://github.com/bkad/CamelCaseMotion
Plug 'bkad/camelcasemotion'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" https://github.com/triglav/vim-visual-increment
" C-V C-A C-X
Plug 'triglav/vim-visual-increment'
" https://github.com/matze/vim-move
Plug 'matze/vim-move'



" **************************
" Undo related
" **************************
" https://github.com/mbbill/undotree
Plug 'mbbill/undotree'



" **************************
" Search related
" **************************
" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
" https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'
" https://github.com/thaerkh/vim-workspace
Plug 'thaerkh/vim-workspace'
" https://github.com/vim-scripts/restore_view.vim
Plug 'vim-scripts/restore_view.vim'
