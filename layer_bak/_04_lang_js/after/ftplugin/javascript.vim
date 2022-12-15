" http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean
" http://learnvimscriptthehardway.stevelosh.com/chapters/12.html
" http://learnvimscriptthehardway.stevelosh.com/chapters/02.html
" use ? to see the option value
" use ! to toggle the option value
"
" https://stackoverflow.com/a/12625504
" use ! on function! will replace previous function definition.
" autocmd is about adding commands into a command list, thus it accumulates!

setlocal number

" **************************
" ALE config
" **************************
let b:ale_fixers = ['eslint']
let b:ale_linters = ['eslint']

augroup CloseLoclistWindowGroupSetting
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

au BufNewFile,BufRead *.js set tabstop=2 softtabstop=2 shiftwidth=2 number

" mapping related
nmap <buffer> <leader>q :lnext<CR>
nmap <buffer> <leader>z :lprevious<CR>
nmap <buffer> <leader>w :cnext<CR>
nmap <buffer> <leader>x :cprevious<CR>
nmap <buffer> <leader>a :lclose<CR>
nmap <buffer> <leader>s :cclose<CR>
