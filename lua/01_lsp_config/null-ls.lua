-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/MAIN.md
local ok, null_ls = pcall(require, "null-ls")
if not ok then
    if PLUGIN_MISSING_NOTIFY then
        print("'null-ls' not available")
    end
    return
end

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    },
})
