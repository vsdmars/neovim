" http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean
" http://learnvimscriptthehardway.stevelosh.com/chapters/12.html
" http://learnvimscriptthehardway.stevelosh.com/chapters/02.html
" use ? to see the option value
" use ! to toggle the option value
"
" https://stackoverflow.com/a/12625504
" use ! on function! will replace previous function definition.
" autocmd is about adding commands into a command list, thus it accumulates!

setlocal noexpandtab
setlocal number

" Create *_test window
command! -bang A call go#alternate#Switch(<bang>0, 'edit')
command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang AS call go#alternate#Switch(<bang>0, 'split')
command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let b:ale_fixers = ['goimports']

" let b:ale_linters = ['gometalinter']
" let b:ale_go_gometalinter_options = '--fast'
" let b:ale_go_gometalinter_lint_package = 1
" let b:ale_linters = ['golangci-lint', 'staticcheck']
" let b:ale_linters = ['golangci-lint', 'golint', 'nakedret', 'aligncheck', 'structcheck', 'varcheck']
let b:ale_linters = ['golangci-lint', 'golint', 'gotype', 'staticcheck', 'govet']
" let b:ale_linters = ['golangci-lint', 'staticcheck']
" golangci-ling bug: https://github.com/golangci/golangci-lint/issues/824
let b:ale_go_golangci_lint_options = '--disable-all -E typecheck'
" let b:ale_go_golangci_lint_options = '--disable-all -E typecheck -E nakedret -E prealloc -E maligned
            " \ -E goconst -E dupl -E unconvert -E stylecheck -E goimports'
            " \ -D deadcode -D structcheck'
let b:ale_go_golangci_lint_package = 1
let b:ale_go_staticcheck_package = 1
" let b:ale_linters = ['staticcheck']
" let b:ale_go_staticcheck_lint_package = 1
" let b:ale_linters = ['govet']

augroup CloseLoclistWindowGroupSetting
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END


" add/remove Go struct tag
nmap <buffer> <leader>t :GoAddTags<CR>
nmap <buffer> <leader>u :GoRemoveTags<CR>

" mapping related
nmap <buffer> <leader>q :lnext<CR>
nmap <buffer> <leader>z :lprevious<CR>
nmap <buffer> <leader>w :cnext<CR>
nmap <buffer> <leader>x :cprevious<CR>
nmap <buffer> <leader>a :lclose<CR>
nmap <buffer> <leader>s :cclose<CR>
