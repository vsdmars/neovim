local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

-- Install packer
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

-- Reload neovim whenever we save plugins.lua
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

    -- Package management
    use {
        "wbthomason/packer.nvim",
        requires = { 
        "nvim-lua/plenary.nvim",
        }
    }

    -- TUI
    use("folke/zen-mode.nvim")
    use("folke/twilight.nvim")
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }


    -- Theme
    use("arcticicestudio/nord-vim")
    use("folke/lsp-colors.nvim")

    -- File management
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        {
            -- only needed if you want to use the commands with "_with_window_picker" suffix
            's1n7ax/nvim-window-picker',
            tag = "v1.*",
            config = function()
              require'window-picker'.setup({
                autoselect_one = true,
                include_current = false,
                filter_rules = {
                  -- filter using buffer options
                  bo = {
                    -- if the file type is one of following, the window will be ignored
                    filetype = { 'neo-tree', "neo-tree-popup", "notify" },

                    -- if the buffer type is one of following, the window will be ignored
                    buftype = { 'terminal', "quickfix" },
                  },
                },
                other_win_hl_color = '#e35e4f',
              })
            end,
          }
        }
    }

    -- Editing
    use("ggandor/leap.nvim")
    use('jinh0/eyeliner.nvim')
    use('bkad/CamelCaseMotion')
    -- use("preservim/nerdcommenter")
    use("numToStr/Comment.nvim")
    use("windwp/nvim-autopairs")
    use("lukas-reineke/indent-blankline.nvim")
    use("lukas-reineke/virt-column.nvim")
    use({ "kylechui/nvim-surround", tag = "*" })
    use("folke/todo-comments.nvim")

    -- File format
    use("avakhov/vim-yaml")
    use("tmux-plugins/vim-tmux")
    use("cespare/vim-toml")

    -- LSP, Snippets, Completions
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    })
    use("jose-elias-alvarez/null-ls.nvim")
    

    -- Diagnostics
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      }

    

    if is_bootstrap then
        require('packer').sync()
    end
end)
