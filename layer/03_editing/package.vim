" **************************
" Buffer related
" **************************
Plug 'vim-scripts/BufOnly.vim'
Plug 'rbgrouleff/bclose.vim'



" **************************
" Editing related
" **************************
" enable opening a file in a given line
" e.g $ vim index.html:20
Plug 'bogado/file-line'

" all trailing whitespace to be highlighted.
" https://github.com/ntpeters/vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'

" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" https://github.com/dyng/ctrlsf.vim
Plug 'dyng/ctrlsf.vim'

" https://github.com/nanotee/zoxide.vim
Plug 'nanotee/zoxide.vim'

" https://github.com/Shougo/neosnippet.vim
" Extra snippet https://github.com/honza/vim-snippets
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" https://github.com/Shougo/context_filetype.vim
" Plug 'Shougo/context_filetype.vim'

" https://github.com/SirVer/ultisnips
" Track the engine.
Plug 'SirVer/ultisnips'

" https://github.com/honza/vim-snippets
" Contains snippets files for various programming languages.
Plug 'honza/vim-snippets'

" https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }


" **************************
" Motion related
" **************************
" https://github.com/bkad/CamelCaseMotion
Plug 'bkad/camelcasemotion'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" https://github.com/triglav/vim-visual-increment
" C-V : select
" C-A : add value to it
" 5C-A : add 5 to the value and etc. to it
" C-X : add letter sequence to it
Plug 'triglav/vim-visual-increment'

" https://github.com/matze/vim-move
" <C-k> Move current line/selections up
" <C-j> Move current line/selections down
" <C-l> Move current line/selections right
" <C-h> Move current line/selections left
Plug 'matze/vim-move'

" scrool smoothly
Plug 'psliwka/vim-smoothie'



" **************************
" Undo related
" **************************
" https://github.com/mbbill/undotree
Plug 'mbbill/undotree'



" **************************
" Search related
" **************************
" https://github.com/ctrlpvim/ctrlp.vim
" ,cp
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'

" https://github.com/thaerkh/vim-workspace
" ,S
Plug 'thaerkh/vim-workspace'

" https://github.com/vim-scripts/restore_view.vim
" Automatically restore one file's cursor position and folding information after restart vim.
Plug 'vim-scripts/restore_view.vim'



" **************************
" Start related
" **************************
" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'



" **************************
" Mark related
" **************************
" https://github.com/kshenoy/vim-signature
Plug 'kshenoy/vim-signature'
