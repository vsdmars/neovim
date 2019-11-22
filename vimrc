" Author: vsdmars vsdmars@gmail.com

set nocompatible        " not compatible with the old-fashion vi mode
set hidden              " set buffer hidden
set exrc
set secure

" set leader to ,
let mapleader=","
let g:mapleader=","

let g:hostname = substitute(system('hostname'), "\n", "", "")

source $HOME/.config/nvim/layer/all-packages.vim

" https://vi.stackexchange.com/a/10125
" Same as:
" filetype on
" filetype plugin on
" filetype indent on
" this is NEEDED for auto completion to run
filetype plugin indent on
