-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
local M = {}

-- We're not using a `pcall()` here since parent node has verified already.
local lspconfig = require("lspconfig")
-- setup from directory lsp_config
local lsp_handlers = require("lsp_config.lsp_handlers")
local diagnostics = require("lsp_config.diagnostics")

-- root_pattern("Cargo.toml", "rust-project.json")

local opts = {
	on_attach = function(client, bufnr)
		lsp_handlers.set_mappings(client, bufnr)
		lsp_handlers.set_autocmds(client, bufnr)
		lsp_handlers.set_additional_plugins(client, bufnr)
		diagnostics.set_mappings(client, bufnr)
	end,
	capabilities = lsp_handlers.capabilities,
	single_file_support = false,
}

M.setup = function()
	lspconfig.rust_analyzer.setup(opts)
end

return M
