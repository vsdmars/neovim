-- https://github.com/ggandor/leap.nvim
local ok, leap = pcall(require, "leap")

if not ok then
    print('"ggandor/leap.nvim" not available')
    return
end

leap.add_default_mappings()
