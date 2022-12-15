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



" **************************
" Syntax related
" **************************
" https://github.com/sheerun/vim-polyglot
" language syntax pack
" :Python3Syntax  : switch python3 syntax
Plug 'sheerun/vim-polyglot'


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
" Press + to expand the visual selection and _ to shrink it.
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
" <F8>
" Plug 'majutsushi/tagbar'

" type tasklist to show todos'
" <F7>
Plug 'vim-scripts/TaskList.vim'

" https://github.com/liuchengxu/vista.vim
Plug 'liuchengxu/vista.vim'



" **************************
" Browsing related
" **************************
" https://github.com/tyru/open-browser.vim
Plug 'tyru/open-browser.vim'
