-- https://github.com/onsails/lspkind.nvim
M = {}
local ok, lspkind = pcall(require, "lspkind")
if not ok then
    print('"onsails/lspkind" not available')
    return
end

initMap = {
    mode = "symbol", -- show only symbol annotations
    menu = {
        nvim_lsp = "[LSP]",
        nvim_lua = "[NVLUA]",
        luasnip = "[SNIP]",
        path = "[Path]",
        buffer = "[BUF]",
    },
    -- prevent the popup from showing more than provided characters
    -- (e.g 50 will not show more than 50 characters)
    maxwidth = 50, 
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    }
}

M.format = lspkind.cmp_format(initMap)
return M
