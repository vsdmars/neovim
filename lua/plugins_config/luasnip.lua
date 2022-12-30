-- https://github.com/windwp/nvim-autopairs

local ok, ls = pcall(require, "luasnip.loaders.from_vscode")
if not ok then
	if PLUGIN_MISSING_NOTIFY then
		print('"luasnip.loaders.from_vscode" not available')
	end
	return
end

ls.lazy_load()
