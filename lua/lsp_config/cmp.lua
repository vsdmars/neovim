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

local lspkind = require("lsp_config.lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm({ select = true }),
            { "i", "c" }
        ),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "vim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "path" },
        { name = "buffer", keyword_length = 4 },
        { name = "treesitter" },
    }),
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.format
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
