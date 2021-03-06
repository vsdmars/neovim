" http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean
" http://learnvimscriptthehardway.stevelosh.com/chapters/12.html
" http://learnvimscriptthehardway.stevelosh.com/chapters/02.html
" use ? to see the option value
" use ! to toggle the option value
"
" https://stackoverflow.com/a/12625504
" use ! on function! will replace previous function definition.
" autocmd is about adding commands into a command list, thus it accumulates!

" Go uses tab instead of space
setlocal noexpandtab
setlocal number

" https://github.com/fatih/vim-go-tutorial
" Create *_test window
command! -bang A call go#alternate#Switch(<bang>0, 'edit')
command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang AS call go#alternate#Switch(<bang>0, 'split')
command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')



" **************************
" ALE config
" **************************
let b:ale_fixers = ['goimports']
" let b:ale_linters = ['golangci-lint', 'golint', 'gotype', 'staticcheck', 'govet']
let b:ale_linters = ['golangci-lint']

" golangci-ling bug: https://github.com/golangci/golangci-lint/issues/824
" let b:ale_go_golangci_lint_options = '--disable-all -E typecheck'
" let b:ale_go_golangci_lint_options = 'run -E maligned'
" let b:ale_go_golangci_lint_options = '--disable-all -E typecheck -E nakedret -E prealloc -E maligned
            " \ -E goconst -E dupl -E unconvert -E stylecheck -E goimports'
            " \ -D deadcode -D structcheck'

" When set to `1`, the whole Go package will be checked instead of only the
" current file.
let b:ale_go_golangci_lint_package = 1
" let b:ale_go_staticcheck_package = 1


" **************************
" coc-go config
" https://github.com/josa42/coc-go
" **************************
augroup CocGoSettings
    au!
    " Add missing imports on save
    au BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
augroup END

nmap gtj :CocCommand go.tags.add json<cr>
nmap gty :CocCommand go.tags.add yaml<cr>
nmap gtx :CocCommand go.tags.add xml<cr>
nmap gtd :CocCommand go.tags.clear<cr>


" https://vimhelp.org/autocmd.txt.html#QuitPre
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
