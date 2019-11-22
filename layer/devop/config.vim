if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '·'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_allow_clobber = 1
