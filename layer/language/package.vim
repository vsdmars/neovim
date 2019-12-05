" **************************
" Completion related
" **************************
" https://github.com/Shougo/deoplete.nvim
" if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
" endif

" do not use deoplete-go since it's using gocode
" https://github.com/deoplete-plugins/deoplete-go
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}



" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}



" **************************
" Linter related
" **************************
" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'



" **************************
" Editing related
" **************************
" https://github.com/Raimondi/delimitMate
" provides automatic closing of quotes
Plug 'Raimondi/delimitMate'
" https://github.com/terryma/vim-expand-region
" vim-expand-region
Plug 'terryma/vim-expand-region'
" https://github.com/easymotion/vim-easymotion
" ,,w
Plug 'Lokaltog/vim-easymotion'
" https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'



" **************************
" Coding related
" **************************
" https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar'
" type tasklist to show todos'
Plug 'vim-scripts/TaskList.vim'
