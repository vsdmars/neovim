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


" Wiki:
" https://github.com/neoclide/coc.nvim/wiki
" https://medium.com/@chemzqm/create-coc-nvim-extension-to-improve-vim-experience-4461df269173
" edit config:
" https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file
" To get the full list checkout the help by
" :h coc-configuration

" There're two types of user configuration files:
    " The user configuration is named as coc-settings.json and placed inside the folder $XDG_CONFIG_HOME/nvim or
    " $HOME/.config/nvim by default（or $HOME/.vim for vim).
    " Run the command :CocConfig to open your user configuration file.

    " The workspace configuration should be named coc-settings.json and be in the directory .vim.
    " After a file is opened in vim, this directory is resolved from the parent directories of that file.
    " Run the command :CocLocalConfig to open your workspace configuration file.

" code complete:
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources

" Use release branch (Recommend)
" K : show code doc
" ,f : reformat select section
" ,a : action to the select section
" ,qf : quick fix current line

" " Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
" 插入模式使用 <c-s> 可切换为不同模式。
"
" Plugins:
" :CocInstall coc-github-users
" https://github.com/cb372/coc-github-users
"
"
"
" https://github.com/neoclide/coc.nvim
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
Plug 'majutsushi/tagbar'

" type tasklist to show todos'
" <F7>
Plug 'vim-scripts/TaskList.vim'
