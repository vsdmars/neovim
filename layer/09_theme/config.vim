" **************************
" Setting
" **************************
set termguicolors
" must set for showing status bar
set laststatus=2
" Set colorscheme and trigger hook
set background=dark
set cursorline        " highlight current line
set t_Co=256          " 256 color mode
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
" rainbox setting
" **************************
" https://github.com/luochen1990/rainbow
" Rainbow operators
let g:rainbow_active = 1
let g:rainbow_conf =
\ {
\  'guifgs': ['darkorange3', 'seagreen3', 'deepskyblue', 'darkorchid3', 'forestgreen', 'lightblue', 'hotpink', 'mistyrose1'],
\  'ctermfgs': ['darkgreen', 'cyan', 'lightgreen', 'lightred'],
\  'operators': '_[\,\+\*\-\&\^\!\.\<\>\=\|\?]_',
\  'parentheses':
\  [
\    'start=/(/ end=/)/ fold',
\    'start=/\[/ end=/\]/ fold',
\    'start=/{/ end=/}/ fold'
\  ],
\  'separately':
\  {
\    'jank':
\    {
\      'parentheses':
\      [
\        'start=/(\ze[^;]/ end=/)/ fold',
\        'start=/\[/ end=/\]/ fold',
\        'start=/{/ end=/}/ fold'
\      ],
\    },
\  }
\}



" **************************
" gruvbox setting
" **************************
" https://github.com/morhetz/gruvbox/wiki/Configuration
" colorscheme gruvbox
" let g:gruvbox_italic=0
" let g:gruvbox_contrast_dark='medium'



" **************************
" Function
" **************************
" Add a hook to patch the colorscheme
function! FixColorscheme()
  hi Pmenu guibg=#eee8d5 guifg=#586e75 gui=none
  hi PmenuSel guibg=#859900 guifg=#586e75 gui=none
endfunction


augroup FixColorschemeSettings
  au!
  au ColorScheme * call FixColorscheme()
augroup END



" **************************
" Lightline setting
" **************************
let g:lightline = {
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
      \   ],
      \   'right':[
      \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
      \     [ 'blame' ]
      \   ],
      \ },
      \ 'component_function': {
      \  'blame': 'LightlineGitBlame',
      \ }
  \ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction



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
