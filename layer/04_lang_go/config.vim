" set ttymouse=sgr
" set updatetime=500
" set balloondelay=250
" set signcolumn=number

" https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt
" https://github.com/fatih/vim-go
" highlight all uses of the identifier under the cursor
let g:go_auto_sameids = 1
" Use this option to show the type info (|:GoInfo|) for the word under the
" cursor automatically.
let g:go_auto_type_info = 1

" Use this option to jump to an existing buffer for the split, vsplit and tab
" mappings
let g:go_def_reuse_buffer = 1

" Control syntax-based folding which
" takes effect when 'foldmethod' is set to `syntax`.
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

let g:go_fmt_command = "goimports"
" using ALE to do the fix/format
let g:go_imports_autosave = 0
let g:go_fmt_autosave = 0

let g:go_fmt_fail_silently = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types = 1

" https://superuser.com/questions/775723/cw-command-in-vim-how-to-avoid-auto-jumping-to-first-error
" https://vi.stackexchange.com/a/13967
let g:go_jump_to_error = 1
let g:go_list_autoclose = 1  " Specifies whether the quickfix/location list should be closed automatically
                             " in the absence of errors.

" https://stackoverflow.com/questions/20933836/what-is-the-difference-between-location-list-and-quickfix-list-in-vim
" quickfix list is global, you can't have more than one available at a time.
" location list is local to the current window.
" let g:go_list_type = "locationlist"
" Default we use quickfix to show global error message
let g:go_list_type = "quickfix"
let g:go_list_type_commands = {
            \ "GoBuild": "quickfix",
            \ "GoErrCheck": "locationlist",
            \ "GoFmt": "locationlist",
            \ "GoModFmt": "locationlist"}

" https://github.com/golangci/golangci-lint
" let g:go_metalinter_command = 'golangci-lint run
            " \ -E nakedret -E prealloc -E maligned -E goconst -E dupl
            " \ -E unconvert -E stylecheck -E goimports -D deadcode
            " \ -D structcheck'
" let g:go_metalinter_enabled = ['nakedret', 'prealloc', 'maligned', 'goconst', 'dupl', 'unconvert', 'stylecheck', 'goimports']
let g:go_metalinter_autosave = 0
" let g:go_metalinter_autosave_enabled = ['golint']
" let g:go_metalinter_deadline = "15s"
let g:go_updatetime = 750

" godoc related
let g:go_doc_popup_window = 1
let g:go_doc_max_height = 20

" annotation related
let g:go_addtags_transform = "camelcase"

" snippet related
let g:go_snippet_engine = "neosnippet"

" gopls related setttings
let g:go_gopls_enabled = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_referrers_mode = 'gopls'
let g:go_gorename_command = 'gorename'
let g:go_gopls_complete_unimported = 1
let g:go_gopls_gofumpt = 1
let g:go_gopls_fuzzy_matching = 1
let g:go_gopls_use_placeholders = 1

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
" https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/
let g:go_def_mapping_enabled = 0
