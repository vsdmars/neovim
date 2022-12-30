-- https://github.com/RRethy/vim-illuminate

local ok, ill = pcall(require, "illuminate")
if not ok then
	if PLUGIN_MISSING_NOTIFY then
		print('"illuminate" not available')
	end
	return
end

ill.configure({
	providers = {
		"lsp",
		"treesitter",
		"regex",
	},
	filetypes_denylist = {
		"dirvish",
		"fugitive",
	},
	under_cursor = true,
	large_file_cutoff = 500,
})
