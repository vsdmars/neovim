" **************************
" Setting
" **************************


" Highlight boundary
" Show overlength line in different color.
highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
match OverLength /\%121v.\+/

" Color conceal characters nicely
hi Conceal guifg=green ctermfg=green
set conceallevel=2
