--[[
P = function(v)
    print(vim.inspect(v))
    return v
end
]]--

-- load https://github.com/nvim-lua/plenary.nvim
local ok, plenary_reload = pcall(require, "plenary.reload")
if not ok then
    reloader = require
else
    reloader = plenary_reload.reload_module
end
-------------------------------------------------------------------------------

RELOAD = function(...)
    return reloader(...)
end
-------------------------------------------------------------------------------

R = function(name)
    RELOAD(name)
    return require(name)
end
-------------------------------------------------------------------------------
-- The function is called `tcodes` for `termcodes`.
-- You don't have to call it that, but I find the terseness convenient
function tcodes(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
-- print(tcodes'<Tab>')
-------------------------------------------------------------------------------

VIM_KEYMAP_SET = vim.keymap.set
VIM_API = vim.api
VIM_MAP = vim.api.nvim_set_keymap
VIM_LOOP = vim.loop
VIM_OPT = vim.opt
VIM_CMD = vim.cmd
VIM_O = vim.o
VIM_G = vim.g

NOREMAP = { noremap = true }
NOREMAP_SILENT = { noremap = true, silent = true }
PLUGIN_MISSING_NOTIFY = false
