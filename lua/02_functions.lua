local api = vim.api
--[[
augroup CmakeSettings
    autocmd!
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal nospell
    autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim
augroup end
--]]

function nvim_create_augroups(definitions)
  -- group_name: startup
  -- definition: {...}
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

-- command! Scratch lua require'tools'.makeScratch()

local M = {}
