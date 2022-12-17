-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
-- https://github.com/p00f/clangd_extensions.nvim
local M = {}

-- We're not using a `pcall()` here since parent node has verified already.
local lspconfig = require("lspconfig")
local lspconfig_util = require("lspconfig.util")
-- setup from directory lsp_config
local lsp_handlers = require("lsp_config.lsp_handlers")
local diagnostics = require("lsp_config.diagnostics")

-- config file for clangd
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
-- root_pattern(
--           '.clangd',
--           '.clang-tidy',
--           '.clang-format',
--           'compile_commands.json',
--           'compile_flags.txt',
--           'configure.ac',
--           '.git'
--         )
--
-- local root_files = {
--     "compile_commands.json",
-- }

-- clangd specific key binding
local set_mappings = function(_, bufnr)
    VIM_KEYMAP_SET(
        { "n" },
        "<leader>gs",
        "<Cmd>ClangdSwitchSourceHeader<Cr>",
        { buffer = bufnr }
    )
end

local opts = {
    on_attach = function(client, bufnr)
        lsp_handlers.set_mappings(client, bufnr)
        lsp_handlers.set_autocmds(client, bufnr)
        lsp_handlers.set_additional_plugins(client, bufnr)
        diagnostics.set_mappings(client, bufnr)
        set_mappings(client, bufnr)
    end,
    capabilities = lsp_handlers.capabilities,
    -- root_dir = function(fname)
    --     return lspconfig_util.root_pattern(unpack(root_files))(fname)
    -- end,
    single_file_support = false,
}

local ok_clangd_extensions, clangd_extensions = pcall(
    require,
    "clangd_extensions"
)

M.setup = function()
    if ok_clangd_extensions then
        clangd_extensions.setup({
            server = opts,
            extensions = {
                autoSetHints = true,
                inlay_hints = {
                    only_current_line = true,
                },
            },
        })
    else
        lspconfig.clangd.setup(opts)
    end
end

return M
