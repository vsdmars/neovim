-- expose diagnos too all language servers
-- setup()
-- set_mappings
local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	-- Neovim has a built in diagnostic abstraction.
	-- Set it up here.
	local diagnostic_config = {
		update_in_insert = false,
		underline = true,
		virtual_text = {
			severity = vim.diagnostic.severity.ERROR,
			source = true,
			spacing = 10,
		},
		-- show signs
		signs = {
			active = signs,
		},
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(diagnostic_config)
end

M.set_mappings = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	VIM_KEYMAP_SET({ "n" }, "]d", vim.diagnostic.goto_next, opts)
	VIM_KEYMAP_SET({ "n" }, "[d", vim.diagnostic.goto_prev, opts)

	if OK_TELESCOPE then
		VIM_KEYMAP_SET({ "n" }, "<leader>df", "<Cmd>Telescope diagnostics<Cr>", opts)
		VIM_KEYMAP_SET({ "n" }, "<leader>lds", function()
			TELESCOPE_BUILTIN.lsp_document_symbols()
		end, opts)
		VIM_KEYMAP_SET({ "n" }, "<leader>ldw", function()
			TELESCOPE_BUILTIN.lsp_dynamic_workspace_symbols()
		end, opts)
	end
end

return M
