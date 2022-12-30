-- https://github.com/nvim-telescope/telescope.nvim

local ok, tel = pcall(require, "telescope")
if not ok then
	if PLUGIN_MISSING_NOTIFY then
		print('"telescope" not available')
	end
	return
end

local open_with_trouble = nil

local ok_trouble, trouble = pcall(require, "trouble")
if ok_trouble then
	open_with_trouble = trouble.open_with_trouble
end

local z_utils = require("telescope._extensions.zoxide.utils")
local builtin = require("telescope.builtin")
local extensions = tel.extensions

tel.setup({
	defaults = {
		prompt_prefix = " ",
		-- selection_caret = "📌 ",
		selection_caret = "👉 ",
		path_display = { "smart" },
		history = {
			path = "~/.telescope_history.sqlite3",
			limit = 100,
		},
		mappings = {
			i = { ["<C-t>"] = open_with_trouble },
			n = { ["<C-t>"] = open_with_trouble },
		},
	},
	extensions = {
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		zoxide = {
			prompt_title = "[ zoxide ]",
			mappings = {
				default = {
					after_action = function(selection)
						print("Update to (" .. selection.z_score .. ") " .. selection.path)
					end,
				},
				["<C-s>"] = {
					before_action = function(selection)
						print("before C-s")
					end,
					action = function(selection)
						vim.cmd("edit " .. selection.path)
					end,
				},
				["<C-q>"] = { action = z_utils.create_basic_command("split") },
			},
		},
	},
})

-- -- Load the extension
tel.load_extension("dap")
tel.load_extension("file_browser")
-- https://github.com/nvim-telescope/telescope-frecency.nvim
-- tel.load_extension("frecency")
tel.load_extension("fzf")
tel.load_extension("luasnip")
tel.load_extension("media_files")
tel.load_extension("packer")
tel.load_extension("smart_history")
tel.load_extension("zoxide")

local project_files = function()
	local ok_git_files = pcall(builtin.git_files, { show_untracked = true })
	if not ok_git_files then
		builtin.find_files({})
	end
end

-- Builtins
VIM_KEYMAP_SET({ "n" }, "<leader>ff", function()
	builtin.find_files()
end, NOREMAP_SILENT)
VIM_KEYMAP_SET({ "n" }, "<leader>fp", function()
	project_files()
end, NOREMAP_SILENT)
VIM_KEYMAP_SET({ "n" }, "<leader>fg", function()
	builtin.live_grep()
end, NOREMAP_SILENT)
VIM_KEYMAP_SET({ "n" }, "<leader>ls", function()
	builtin.buffers()
end, NOREMAP_SILENT)
VIM_KEYMAP_SET({ "n" }, "<leader>ft", function()
	builtin.builtin()
end, NOREMAP_SILENT)
VIM_KEYMAP_SET({ "n" }, "<C-_>", function()
	builtin.current_buffer_fuzzy_find({
		previewer = false,
		skip_empty_lines = true,
	})
end, NOREMAP_SILENT)
VIM_KEYMAP_SET({ "n" }, "<leader>ht", function()
	builtin.help_tags()
end, NOREMAP_SILENT)
VIM_KEYMAP_SET({ "n" }, "<leader>ch", function()
	builtin.command_history()
end, NOREMAP_SILENT)
VIM_KEYMAP_SET({ "n" }, "<leader>sh", function()
	builtin.search_history()
end, NOREMAP_SILENT)
VIM_KEYMAP_SET({ "n" }, "<leader>fo", function()
	builtin.oldfiles()
end, NOREMAP_SILENT)
VIM_KEYMAP_SET({ "n" }, "<leader>fb", function()
	extensions.file_browser.file_browser()
end, NOREMAP_SILENT)

-- `find_files` and `file_browser` for custom locations which I need to visit
-- often
-- `fz` - Find fuzzy
--      - This is different from `ff` to avoid the `timeoutlen` delay
-- `fe` - File explorer
--      - This is different from `fb` to avoid the `timeoutlen` delay

-- Neovim
VIM_KEYMAP_SET({ "n" }, "<leader>fzv", function()
	builtin.find_files({
		cwd = "~/.config/nvim/",
	})
end, NOREMAP_SILENT)
VIM_KEYMAP_SET({ "n" }, "<leader>fev", function()
	extensions.file_browser.file_browser({
		path = "~/.config/nvim/",
		cwd_to_path = true,
	})
end, NOREMAP_SILENT)

-- Chezmoi
-- VIM_KEYMAP_SET({ "n" }, "<leader>fzc", function()
-- 	builtin.find_files({
-- 		cwd = "~/.local/share/chezmoi/",
-- 	})
-- end, NOREMAP_SILENT)
-- VIM_KEYMAP_SET({ "n" }, "<leader>fec", function()
-- 	extensions.file_browser.file_browser({
-- 		path = "~/.local/share/chezmoi/",
-- 		cwd_to_path = true,
-- 	})
-- end, NOREMAP_SILENT)

-- Journal
-- VIM_KEYMAP_SET({ "n" }, "<leader>fzj", function()
-- 	builtin.find_files({
-- 		cwd = "~/code/notes/journal/journal/",
-- 	})
-- end, NOREMAP_SILENT)
-- VIM_KEYMAP_SET({ "n" }, "<leader>fej", function()
-- 	extensions.file_browser.file_browser({
-- 		path = "~/code/notes/journal/journal/",
-- 		cwd_to_path = true,
-- 	})
-- end, NOREMAP_SILENT)

-- Chezmoi
-- VIM_KEYMAP_SET({ "n" }, "<leader>fzn", function()
-- 	builtin.find_files({
-- 		cwd = "~/code/notes/notebook/notebook",
-- 	})
-- end, NOREMAP_SILENT)
-- VIM_KEYMAP_SET({ "n" }, "<leader>fen", function()
-- 	extensions.file_browser.file_browser({
-- 		path = "~/code/notes/notebook/notebook/",
-- 		cwd_to_path = true,
-- 	})
-- end, NOREMAP_SILENT)

-- Extensions
VIM_KEYMAP_SET({ "n" }, "<leader>fq", function()
	extensions.frecency.frecency()
end, NOREMAP_SILENT)
VIM_KEYMAP_SET({ "n" }, "<leader>fs", function()
	extensions.luasnip.luasnip()
end, NOREMAP_SILENT)
