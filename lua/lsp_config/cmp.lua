-- https://github.com/hrsh7th/nvim-cmp
local ok, cmp = pcall(require, "cmp")
if not ok then
	print('"nvim-cmp" not available')
	return
end

local ok, luasnip = pcall(require, "luasnip")
if not ok then
	print('"L3MON4D3/LuaSnip" not available, for use in "nvim-cmp"')
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

local lspkind = require("lsp_config.lspkind")

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<Cr>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<C-a>"] = cmp.mapping(
			cmp.mapping.complete({
				reason = cmp.ContextReason.Auto,
			}),
			{ "i", "c" }
		),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "vim_lsp" },
		{ name = "luasnip" },
		{ name = "luasnip_choice" },
	}, {
		{ name = "path" },
		{ name = "buffer", keyword_length = 4 },
		{ name = "treesitter" },
	}),
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = lspkind.format,
	},
	view = {
		entries = {
			name = "custom",
			selection_order = "near_cursor",
		},
	},
	experimental = {
		ghost_text = true,
	},
	enabled = function()
		return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
	end,
})

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
	sources = {
		{ name = "dap" },
	},
})

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
