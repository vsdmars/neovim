-- in tools.lua

local api = vim.api

local M = {}

function M.makeScratch()
    print("hello lua!")
    api.nvim_command('enew') -- equivalent to :enew
end

return M
