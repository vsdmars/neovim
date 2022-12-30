-- https://github.com/jinh0/eyeliner.nvim

--[[
Keys:
f/F/t/T

    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
--]]

local ok, eyeliner = pcall(require, "eyeliner")
if not ok then
	if PLUGIN_MISSING_NOTIFY then
		print("jinh0/eyeliner.nvim not available")
	end
	return
end

eyeliner.setup({
	highlight_on_key = true,
})

-- vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#000000", bold = true, underline = true })
-- vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#ffffff", underline = true })
