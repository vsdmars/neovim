" https://github.com/vim-scripts/ingo-library
" Plug 'vim-scripts/ingo-library'
" https://github.com/vim-scripts/SyntaxRange
" Plug 'vim-scripts/SyntaxRange'

" https://github.com/godlygeek/tabular
Plug 'godlygeek/tabular', {
      \ 'for' : ['markdown'],
\ }

" https://github.com/plasticboy/vim-markdown
" The following commands are useful to open and close folds:
" zr: reduces fold level throughout the buffer
" zR: opens all folds
" zm: increases fold level throughout the buffer
" zM: folds everything all the way
" za: open a fold your cursor is on
" zA: open a fold your cursor is on recursively
" zc: close a fold your cursor is on
" zC: close a fold your cursor is on recursively
Plug 'plasticboy/vim-markdown', {
      \ 'for' : ['markdown'],
\ }

" https://github.com/avakhov/vim-yaml
Plug 'avakhov/vim-yaml'

" **************************
" Tmux related
" **************************
" https://github.com/tmux-plugins/vim-tmux
" understand .tmux.conf
Plug 'tmux-plugins/vim-tmux'
