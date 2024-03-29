local fn = vim.fn

-- set packer.nvim path
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

-- Install packer.nvim
if fn.empty(fn.glob(install_path)) > 0 then
	is_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer. Close and reopen Neovim once done...")
	vim.cmd([[packadd packer.nvim]])
end

-- Reload neovim whenever we save this file.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost 00_plugins.lua source <afile> | PackerSync
  augroup end
]])

local ok, packer = pcall(require, "packer")
if not ok then
	print("packer.nvim not installed. No plugins will get installed.")
	return
end

-- https://github.com/wbthomason/packer.nvim#custom-initialization
packer.init({
	-- package_root = "~/.local/share/nvim/site/pack"
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Libraries
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("lewis6991/impatient.nvim")
	use("stevearc/dressing.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("kkharji/sqlite.lua")

	-- Package management
	use({
		"wbthomason/packer.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- TUI
	use("folke/twilight.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- Theme
	use("folke/zen-mode.nvim") -- not setup yet
	use("arcticicestudio/nord-vim")
	use("folke/lsp-colors.nvim")
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	-- File management
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				tag = "v1.*",
				config = function()
					require("window-picker").setup({
						autoselect_one = true,
						include_current = false,
						filter_rules = {
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },

								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
						other_win_hl_color = "#e35e4f",
					})
				end,
			},
		},
	})

	-- Editing
	use("ggandor/leap.nvim")
	use("jinh0/eyeliner.nvim")
	use("bkad/CamelCaseMotion")
	use("numToStr/Comment.nvim")
	use("windwp/nvim-autopairs")
	use("lukas-reineke/indent-blankline.nvim")
	use("lukas-reineke/virt-column.nvim")
	use({ "kylechui/nvim-surround", tag = "*" })
	use("folke/todo-comments.nvim")
	use("ntpeters/vim-better-whitespace")
	use("lcheylus/overlength.nvim")
	use("RRethy/vim-illuminate")

	-- File format
	use("avakhov/vim-yaml")
	use("tmux-plugins/vim-tmux")
	use("cespare/vim-toml")

	-- LSP
	use({
		-- Easily install and manage LSP servers, DAP servers, linters, and formatters.
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- Code completion
	use({
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp", -- completion engine plugin
	})
	use("hrsh7th/cmp-nvim-lua") -- nvim-cmp source for neovim Lua API.

	-- Code tooling
	use("ray-x/lsp_signature.nvim") -- show function signature
	use("onsails/lspkind.nvim") -- adds vscode-like pictograms to neovim built-in lsp
	-- use("p00f/clangd_extensions.nvim")

	-- LSP DAP
	use("mfussenegger/nvim-dap") -- Debug Adapter Protocol client implementation
	use("rcarriga/cmp-dap")

	-- Diagnostics
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	})
	use("weilbith/nvim-code-action-menu") --  provides a handy pop-up menu for code actions

	-- Snippets
	use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
	use("saadparwaiz1/cmp_luasnip")
	use({
		"doxnit/cmp-luasnip-choice",
		config = function()
			require("cmp_luasnip_choice").setup({
				auto_open = true, -- Automatically open nvim-cmp on choice node (default: true)
			})
		end,
	})
	use("rafamadriz/friendly-snippets") -- vscode snippets

	-- Formatters
	use("jose-elias-alvarez/null-ls.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope-smart-history.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use({ "nvim-telescope/telescope-frecency.nvim", requires = { "kkharji/sqlite.lua" } })
	use("nvim-telescope/telescope-dap.nvim")
	use("nvim-telescope/telescope-packer.nvim")
	use("nvim-telescope/telescope-symbols.nvim")
	use("benfowler/telescope-luasnip.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("jvgrootveld/telescope-zoxide")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("ray-x/cmp-treesitter")

	-- Git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	if is_bootstrap then
		require("packer").sync()
	end
end)
