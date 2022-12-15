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

    -- Package management
    use("wbthomason/packer.nvim")


    if is_bootstrap then
        require('packer').sync()
    end
end)
