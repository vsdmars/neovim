-- https://github.com/kylechui/nvim-surround

local ok, surround = pcall(require, "nvim-surround")
if not ok then
    if PLUGIN_MISSING_NOTIFY then
        print("'/kylechui/nvim-surround' not available")
    end
    return
end

surround.setup()
