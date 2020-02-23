" https://github.com/davidhalter/jedi-vim
Plug 'davidhalter/jedi-vim'

" https://github.com/fisadev/vim-isort
" sort python imports
Plug 'fisadev/vim-isort'

" https://github.com/tmhedberg/SimpylFold
" Folding
" Plug 'tmhedberg/SimpylFold'
"
" yapf support
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

" https://github.com/Chiel92/vim-autoformat
" $ python3 -m pip install pynvim
" needs autopep8, pylint
Plug 'Chiel92/vim-autoformat'

" https://github.com/Vimjas/vim-python-pep8-indent
Plug 'Vimjas/vim-python-pep8-indent'

" https://github.com/jeetsukumaran/vim-pythonsense
"
" Python Object Motions
"]]" : Move (forward) to the beginning of the next Python class.

"][" : Move (forward) to the end of the current Python class.

"[[" : Move (backward) to beginning of the current Python class (or beginning of the previous Python class if not currently in a class or already at the beginning of a class).

"[]" : Move (backward) to end of the previous Python class.

"]m" : Move (forward) to the beginning of the next Python method or function.

"]M" : Move (forward) to the end of the current Python method or function.

"[m" : Move (backward) to the beginning of the current Python method or function (or to the beginning of the previous method or function if not currently in a method/function or already at the beginning of a method/function).

"[M" : Move (backward) to the end of the previous Python method or function.
Plug 'jeetsukumaran/vim-pythonsense'
