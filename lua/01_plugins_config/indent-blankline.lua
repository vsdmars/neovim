-- https://github.com/lukas-reineke/indent-blankline.nvim

local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
    if PLUGIN_MISSING_NOTIFY then
        print('"lukas-reineke/indent-blankline.nvim" not available')
    end
    return
end

indent_blankline.setup({
    char = "┊",
})
