-- https://github.com/windwp/nvim-autopairs

local ok, _ = pcall(require, "nvim-autopairs")
if not ok then
    if PLUGIN_MISSING_NOTIFY then
        print('"windwp/nvim-autopairs.nvim" not available')
    end
    return
end

require("nvim-autopairs").setup()
