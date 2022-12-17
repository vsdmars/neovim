-- 'numToStr/Comment.nvim'

local ok, comment = pcall(require, "Comment")
if not ok then
    if PLUGIN_MISSING_NOTIFY then
        print('"numToStr/Comment.nvim" not available')
    end
    return
end

comment.setup({
 toggler = {
        -- -Line-comment toggle keymap
        line = '<leader>cc',
        ---Block-comment toggle keymap
        block = '<leader>bc',
    },
 opleader = {
        ---Line-comment keymap
        line = '<leader>c',
        ---Block-comment keymap
        block = '<leader>cb',
    },
 extra = {
        ---Add comment on the line above
        above = '<leader>cO',
        ---Add comment on the line below
        below = '<leader>co',
        ---Add comment at the end of line
        eol = '<leader>cA',
    },
})
