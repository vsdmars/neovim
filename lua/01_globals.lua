-- https://github.com/nanotee/nvim-lua-guide
--[[
Runtime files
Much like Vimscript files, Lua files can be loaded automatically from special folders in your runtimepath.
Currently, the following folders are supported:
colors/
compiler/
ftplugin/
ftdetect/
indent/
plugin/
syntax/

* in a runtime directory, all *.vim files are sourced before *.lua files.
]]
--

-- :help lua-vim
-- :help vim.pretty_print())
-- :lua =vim.loop // pretty print

-- eval vimscript expression
-- $ vim.api.nvim_eval()
-- $ print(vim.api.nvim_eval('1 + 1')) -- 2

-- https://github.com/nanotee/nvim-lua-guide#vimapinvim_exec
-- $ vim.api.nvim_exec() // chunk vim script
-- $ vim.cmd() -- same above
-- $ vim.cmd([[%s/\Vfoo/bar/g]])

-- call vim's :ex
-- $ vim.api.nvim_command()
-- $ vim.api.nvim_command('set nonumber')

-- This API function allows you to escape terminal codes and Vim keycodes.
-- $ vim.api.nvim_replace_termcodes()
-- e.g.
-- $ inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
-- to lua:
-- function _G.smart_tab()
--      return vim.fn.pumvisible() == 1 and [[\<C-N>]] or [[\<Tab>]]
-- end
-- vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})

-- above print \<Tab> and \<C-N> literally due to Being able to escape keycodes is actually a Vimscript feature.
-- use this instead:
-- $ print(vim.api.nvim_replace_termcodes('<Tab>', true, true, true))

-- Neovim provides a set of API functions to either set an option or get its current value:
-- Global options:
--  vim.api.nvim_set_option()
--  vim.api.nvim_get_option()
-- Buffer-local options:
--  vim.api.nvim_buf_set_option()
--  vim.api.nvim_buf_get_option()
-- Window-local options:
--  vim.api.nvim_win_set_option()
--  vim.api.nvim_win_get_option()
--
-- e.g.
-- $ vim.api.nvim_set_option('smarttab', false)
-- $ vim.api.nvim_win_set_option(0, 'number', true)
-- $ vim.api.nvim_buf_set_option(10, 'shiftwidth', 4)

-- :set+=, :set^= and :set-= in lua:
-- :help vim.opt
-- $ vim.opt.shortmess:append({ I = true })
-- alternative form:
-- $ vim.opt.shortmess = vim.opt.shortmess + { I = true }
-- $ vim.opt.whichwrap:remove({ 'b', 's' })
-- alternative form:
-- $ vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' }

-- internal variables have their own set of API functions:
-- With the exception of predefined Vim variables, they can also be deleted
-- (the :unlet command is the equivalent in Vimscript). Local variables (l:),
-- script variables (s:) and function arguments (a:) cannot be manipulated as
-- they only make sense in the context of a Vim script, Lua has its own scoping rules.
-- :help internal-variables
--
-- Global variables (g:):
--  $ vim.api.nvim_set_var()
--  $ vim.api.nvim_get_var()
--  $ vim.api.nvim_del_var()
-- Buffer variables (b:):
--  $ vim.api.nvim_buf_set_var()
--  $ vim.api.nvim_buf_get_var()
--  $ vim.api.nvim_buf_del_var()
-- Window variables (w:):
--  $ vim.api.nvim_win_set_var()
--  $ vim.api.nvim_win_get_var()
--  $ vim.api.nvim_win_del_var()
-- Tabpage variables (t:):
--  $ vim.api.nvim_tabpage_set_var()
--  $ vim.api.nvim_tabpage_get_var()
--  $ vim.api.nvim_tabpage_del_var()
-- Predefined Vim variables (v:):
--  $ vim.api.nvim_set_vvar()
--  $ vim.api.nvim_get_vvar()
--
-- e.g.
-- $ vim.api.nvim_set_var('some_global_variable', { key1 = 'value', key2 = 300 })
-- $ print(vim.inspect(vim.api.nvim_get_var('some_global_variable'))) -- { key1 = "value", key2 = 300 }
-- $ vim.api.nvim_del_var('some_global_variable')
--
-- $ vim.api.nvim_win_set_var(0, 'some_window_variable', 2500)
-- $ vim.api.nvim_tab_set_var(3, 'some_tabpage_variable', 'hello world')
-- $ print(vim.api.nvim_win_get_var(0, 'some_window_variable')) -- 2500
-- $ print(vim.api.nvim_buf_get_var(3, 'some_tabpage_variable')) -- 'hello world'
-- $ vim.api.nvim_win_del_var(0, 'some_window_variable')
-- $ vim.api.nvim_buf_del_var(3, 'some_tabpage_variable')

-- Internal variables can be manipulated more intuitively using these meta-accessors:
-- vim.g: global variables
-- vim.b: buffer variables
-- vim.w: window variables
-- vim.t: tabpage variables
-- vim.v: predefined Vim variables
-- vim.env: environment variables
--
-- e.g.
-- vim.g.some_global_variable = {
-- key1 = 'value',
-- key2 = 300
-- }
-- vim.g.some_global_variable = nil
-- Some variable names may contain characters that cannot be used for identifiers in Lua. You can still manipulate these variables by using this syntax: vim.g['my#variable'].
-- :help lua-vim-variables

-- Calling Vimscript functions https://github.com/nanotee/nvim-lua-guide#calling-vimscript-functions
-- e.g.
-- $ print(vim.fn.printf('Hello from %s', 'Lua'))
--
-- Hashes (#) are not valid characters for identifiers in Lua, so autoload functions have to be called with this syntax:
-- $ vim.fn['my#autoload#function']()
--
-- The functionality of vim.fn is identical to vim.call, but allows a more Lua-like syntax.
-- It is distinct from vim.api.nvim_call_function in that converting Vim/Lua objects is automatic: vim.api.nvim_call_function returns a table for floating point numbers and does not accept Lua closures while vim.fn handles these types transparently.
-- :help vim.fn

-- :help vim-function for an alphabetical list and
-- :help function-list for a list of functions grouped by topic.

-- In Lua only false and nil are considered falsy, numbers always evaluate to true no matter their value. You have to explicitly check for 1 or 0:
-- if vim.fn.has('nvim') == 1 then
-- do something...
-- end

-- Define mappings https://github.com/nanotee/nvim-lua-guide#defining-mappings
-- Neovim provides two functions to set/del mappings:
-- $ vim.keymap.set()
-- $ vim.keymap.del()
--
-- e.g.
-- $ vim.keymap.set({'n', 'c'}, '<Leader>ex2', '<Cmd>lua vim.notify("Example 2")<CR>')
--
-- :help vim.keymap.set()

-- Defining user commands https://github.com/nanotee/nvim-lua-guide#defining-user-commands
-- Global user commands:
--  $ vim.api.nvim_create_user_command()
--  $ vim.api.nvim_del_user_command()
-- Buffer-local user commands:
--  $ vim.api.nvim_buf_create_user_command()
--  $ vim.api.nvim_buf_del_user_command()
--
-- e.g.
-- $ vim.api.nvim_create_user_command('Upper', 'echo toupper(<q-args>)', { nargs = 1 })
-- same as :command! -nargs=1 Upper echo toupper(<q-args>)
-- $ vim.cmd('Upper hello world') -- prints "HELLO WORLD"
-- OR command as a Lua function callback:
-- vim.api.nvim_create_user_command(
-- 'Upper',
-- function(opts)
-- print(string.upper(opts.args))
-- end,
-- { nargs = 1 }
-- )
-- Two additional attributes are available:
--   desc allows you to control what gets displayed when you run :command {cmd} on a command defined as a Lua callback. Similarly to keymaps, it is recommended to add a desc key to commands defined as Lua functions.
--   force is equivalent to calling :command! and replaces a command if one with the same name already exists. It is true by default, unlike its Vimscript equivalent.
--
-- :help command-attributes

-- Don't pad Lua strings!
-- wrong:
-- $ vim.api.nvim_set_keymap('n', '<Leader>f', [[ <Cmd>call foo()<CR> ]], {noremap = true})
-- map to <Space><Cmd>call foo()<CR><Space>
-- not <Cmd>call foo()<CR>

-- Notes about Vimscript <-> Lua type conversion
-- Converting a variable creates a copy. https://github.com/nanotee/nvim-lua-guide#converting-a-variable-creates-a-copy

-- While you can call Vim functions in Lua with vim.fn, you can't hold references to them. This can cause surprising behaviors:
-- local FugitiveHead = vim.fn.funcref('FugitiveHead')
-- print(FugitiveHead) -- vim.NIL
--
-- vim.cmd("let g:test_dict = {'test_lambda': {-> 1}}")
-- print(vim.g.test_dict.test_lambda) -- nil
-- print(vim.inspect(vim.g.test_dict)) -- {}

-- Lua booleans are converted to actual booleans in Vimscript, not numbers:
-- lua vim.g.lua_true = true
-- echo g:lua_true
-- " v:true
-- lua vim.g.lua_false = false
-- echo g:lua_false
-- " v:false

-------------------------------------------------------------------------------

-- vimscript to lua
-- luaeval() takes an optional second argument that allows you to pass data to the expression. You can then access that data from Lua using the magic global _A:
-- $ echo luaeval('_A[1] + _A[2]', [1, 1])
-- " 2
-- $ echo luaeval('string.format("Lua is %s", _A)', 'awesome')
-- " 'Lua is awesome'
-------------------------------------------------------------------------------

-- PUT is a global function that print lua object in readable format.
function _G.PUT(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	print(table.concat(objects, "\n"))
	return ...
end

-- load https://github.com/nvim-lua/plenary.nvim
-- reload the Lua module instead of the cached ones.
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
-- R is used for reloading lua pacakge.
function _G.R(name)
	RELOAD(name)
	return require(name)
end

-------------------------------------------------------------------------------
-- tcodes is used for setting termcodes.
-- You don't have to call it that, but I find the terseness convenient
function _G.tcodes(str)
	-- Adjust boolean arguments as needed
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- print(tcodes'<Tab>')
-------------------------------------------------------------------------------

VIM_KEYMAP_SET = vim.keymap.set
VIM_API = vim.api
VIM_MAP = vim.api.nvim_set_keymap
VIM_LOOP = vim.loop
VIM_OPT = vim.opt -- behaves like :set
VIM_GOPT = vim.opt_global -- behaves like :setglobal
VIM_LOPT = vim.opt_local -- behaves like :setlocal
VIM_CMD = vim.cmd -- behaves like vim.api.nvim_exec()
VIM_G = vim.g -- Global (g:) editor variables.
VIM_O = vim.o -- behaves like :let &{option-name}
VIM_GO = vim.go -- behaves like :let &g:{option-name}, Get or set global options. Like :setglobal
VIM_BO = vim.bo -- behaves like :let &l:{option-name} for buffer-local options
-- e.g. $ vim.bo[4].expandtab = true -- buffer 4
VIM_WO = vim.wo -- behaves like :let &l:{option-name} for window-local options
VIM_LSP = vim.lsp

-- syntax sugar
NOREMAP = { noremap = true }
NOREMAP_SILENT = { noremap = true, silent = true }
PLUGIN_MISSING_NOTIFY = true
