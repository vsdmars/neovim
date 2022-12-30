-- expose these to all language servers
-- setup()
-- set_mappings()
-- set_autocmds()
-- set_additional_plugins
-- capabilities, from nvim-cmp
local M = {}

M.setup = function()
	VIM_LSP.handlers["textDocument/hover"] = VIM_LSP.with(VIM_LSP.handlers.hover, {
		border = "rounded",
	})

	VIM_LSP.handlers["textDocument/signatureHelp"] = VIM_LSP.with(VIM_LSP.handlers.signature_help, {
		border = "rounded",
	})
end

M.set_mappings = function(_, bufnr) -- (client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	VIM_KEYMAP_SET({ "n" }, "<leader>K", VIM_LSP.buf.hover, opts)
	VIM_KEYMAP_SET({ "n" }, "<leader>gd", VIM_LSP.buf.definition, opts)
	VIM_KEYMAP_SET({ "n" }, "<leader>gD", VIM_LSP.buf.declaration, opts)
	VIM_KEYMAP_SET({ "n" }, "<leader>gt", VIM_LSP.buf.type_definition, opts)
	VIM_KEYMAP_SET({ "n" }, "<leader>gi", VIM_LSP.buf.implementation, opts)
	VIM_KEYMAP_SET({ "n" }, "<leader>rn", VIM_LSP.buf.rename, opts)
	VIM_KEYMAP_SET({ "n" }, "<leader>gf", VIM_LSP.buf.format, opts)

	if OK_TELESCOPE then
		VIM_KEYMAP_SET({ "n" }, "<leader>rf", TELESCOPE_BUILTIN.lsp_references, opts)
	end
end

M.set_autocmds = function(client, _) -- (client, bufnr)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		local group = VIM_API.nvim_create_augroup("lsp_document_highlight", { clear = true })
		VIM_API.nvim_create_autocmd({ "CursorHold" }, {
			group = group,
			buffer = 0,
			callback = VIM_LSP.buf.document_highlight,
		})
		VIM_API.nvim_create_autocmd({ "CursorMoved" }, {
			group = group,
			buffer = 0,
			callback = VIM_LSP.buf.clear_references,
		})
	end
end

M.set_additional_plugins = function(client, bufnr)
	require("lsp_config.lsp_signature").setup(client, bufnr)
end

-- setup nvim-cmp for all languages
M.capabilities = nil
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	local capabilities = VIM_LSP.protocol.make_client_capabilities()
	M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

return M
