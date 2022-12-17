-- https://github.com/nvim-lualine/lualine.nvim

local ok, lualine = pcall(require, "lualine")
if not ok then
    if PLUGIN_MISSING_NOTIFY then
        print('"nvim-lualine/lualine.nvim" not available')
    end
    return
end

lualine.setup()
