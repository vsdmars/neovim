" [link text](link-url.md) should reference link-url.md
let g:vim_markdown_no_extensions_in_markdown = 0
let g:vim_markdown_folding_disabled = 0
set foldenable

" Reference: http://blog.ciplogic.com/index.php/blog/95-vim-asciidoc-or-markdown-source-code-blocks-highlight
function! FormatJson()
  exec "%!python -m json.tool"
endfunction!

command! FormatJson :call FormatJson()
hi SpellBad cterm=underline

augroup TxtRelatedSettings
    autocmd!
    autocmd BufNewFile,BufRead *.txt,*.doc set spell spelllang=en_us
augroup END


augroup OtherLangRelatedSettings
    autocmd!
    au BufNewFile,BufRead *.js,*.html,*.css set tabstop=4 softtabstop=4 shiftwidth=4 number
augroup END


" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
     \	if &omnifunc == "" |
     \		setlocal omnifunc=syntaxcomplete#Complete |
     \	endif
endif
