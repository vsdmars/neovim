" Always show a helpful statusline
set laststatus=2

" Custom tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#tabline#tab_nr_type = 1


" fonts
let g:airline_powerline_fonts = 1

" Don't let just anyone take over the statusline
let g:airline_extensions = ['tabline', 'ctrlp']

" theme
let g:airline_theme = 'molokai'

" CtrlP
let g:airline#extensions#ctrlp#show_adjacent_modes = 0

" if !exists('g:airline_symbols')
  " let g:airline_symbols={}
" endif

" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.paste = ''
" let g:airline_symbols.whitespace = ''
" let g:airline_symbols.spell = ''
" let g:airline_symbols.notexists = ''

" Short form modes
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
