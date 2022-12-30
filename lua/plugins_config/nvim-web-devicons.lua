-- https://github.com/nvim-tree/nvim-web-devicons

local ok, nwd = pcall(require, "nvim-web-devicons")
if not ok then
    if PLUGIN_MISSING_NOTIFY then
        print('"nvim-web-devicons" not available')
    end
    return
end

nwd.setup({
    color_icons = true,
})

nwd.get_icons()
