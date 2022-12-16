-- https://github.com/arcticicestudio/nord-vim

VIM_G.nord_cursor_line_number_background = true
VIM_G.nord_bold_vertical_split_line = true
VIM_G.nord_uniform_diff_background = true
VIM_G.nord_italic_comments = true
VIM_CMD[[colorscheme nord]]

-- https://luabyexample.org/docs/nvim-autocmd/
VIM_API.nvim_create_augroup("nord-theme-overrides", 
    {
        clear = true
    }
)
VIM_CMD[[autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB ]]

--[[
augroup nord-theme-overrides
  autocmd!
  " Use 'nord7' as foreground color for Vim comment titles.
  autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
augroup END
]]--
