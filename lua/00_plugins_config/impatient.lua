-- https://github.com/lewis6991/impatient.nvim
_G.__luacache_config = { modpaths = { enable = false } }

local ok, _ = pcall(require, "impatient")
if not ok then
    print('"lewis6991/impatient.nvim" not available')
end
