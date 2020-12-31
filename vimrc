" Author: vsdmars vsdmars@gmail.com

set nocompatible        " not compatible with the old-fashion vi mode
set hidden              " set buffer hidden

set exrc                " beware of potential security issues

" When secure is on, ":autocmd", shell and write commands are not allowed in
".nvimrc" and ".exrc" in the current directory and map commands are
" displayed.
set secure              " go with set exrc

" set leader to ,
let mapleader=","
let g:mapleader=","

let g:hostname = substitute(system('hostname'), "\n", "", "")

let g:python3_host_prog = 'python3'

source $HOME/.config/nvim/layer/all-packages.vim

" https://vi.stackexchange.com/a/10125
" Same as:
" filetype on
" filetype plugin on
" filetype indent on
" this is NEEDED for auto completion to run
filetype plugin indent on
