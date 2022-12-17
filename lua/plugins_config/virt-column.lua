-- https://github.com/lukas-reineke/virt-column.nvim

local ok, virt_column = pcall(require, "virt-column")
if not ok then
    if PLUGIN_MISSING_NOTIFY then
        print("lukas-reineke/virt-column.nvim not available")
    end
    return
end

virt_column.setup({})
