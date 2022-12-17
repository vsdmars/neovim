-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/MAIN.md
local ok, null_ls = pcall(require, "null-ls")
if not ok then
	if PLUGIN_MISSING_NOTIFY then
		print("'null-ls' not available")
	end
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

attach_fn = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		VIM_API.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		VIM_API.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				VIM_LSP.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
	},
	on_attach = attach_fn,
})
