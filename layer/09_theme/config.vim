" **************************
" Setting
" **************************
set termguicolors

" must set for showing status bar
set laststatus=2

" Set colorscheme and trigger hook
set background=dark
set cursorline        " highlight current line

if !has('gui_running')
  set t_Co=256
endif

" do not use syntax on in ftplugin
syntax on

" Modify theme color basic
" hi Visual ctermbg=018 guibg=#003853
" hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

" get rid of extra --insert-- notification
set noshowmode

" Highlight boundary
" Show overlength line in different color.
highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
match OverLength /\%121v.\+/

" Color conceal characters nicely
hi Conceal guifg=green ctermfg=green
set conceallevel=2


" **************************
" nord setting
" **************************
" getColorCode foreground|more
colorscheme nord
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_italic_comments = 1

augroup nord-theme-overrides
  autocmd!
  " Use 'nord7' as foreground color for Vim comment titles.
  autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
augroup END
