let g:rustfmt_autosave = 1

" https://github.com/racer-rust/vim-racer
let g:racer_cmd = "/home/vsdmars/.cargo/bin/racer"

let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

augroup RustLangSettings
    au!
    au FileType rust nmap gd <Plug>(rust-def)
    au FileType rust nmap gs <Plug>(rust-def-split)
    au FileType rust nmap gx <Plug>(rust-def-vertical)
    au FileType rust nmap <leader>gd <Plug>(rust-doc)
augroup END
