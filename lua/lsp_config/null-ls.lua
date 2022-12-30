-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/MAIN.md
local ok, null_ls = pcall(require, "null-ls")
if not ok then
	if PLUGIN_MISSING_NOTIFY then
		print("'null-ls' not available")
	end
	return
end

local with_diagnostics_code = function(builtin)
	return builtin.with({
		diagnostics_format = "#{m} [#{c}]",
	})
end

local with_root_file = function(builtin, file)
	return builtin.with({
		condition = function(utils)
			return utils.root_has_file(file)
		end,
	})
end

-- formatting setup
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

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md
null_ls.setup({
	debug = true,
	debounce = 150,
	sources = {
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.completion.spell,
		-- formatting
		null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.cmake_format,
		null_ls.builtins.formatting.fixjson,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.shfmt,
		with_root_file(null_ls.builtins.formatting.stylua, "stylua.toml"),

		with_diagnostics_code(null_ls.builtins.diagnostics.shellcheck),
	},
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
	on_init = function(new_client, _)
		new_client.offset_encoding = "utf-8"
	end,
	on_attach = attach_fn,
})

-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end
