-- https://github.com/lcheylus/overlength.nvim

local ok, ol = pcall(require, "overlength")
if not ok then
	if PLUGIN_MISSING_NOTIFY then
		print('"overlength" not available')
	end
	return
end

ol.setup({
	-- Colors for highlight by specifying a ctermbg and bg
	ctermbg = "darkgrey",
	bg = "#8B0000",
	default_overlength = 120,
	-- How many spaces past your overlength to start highlighting
	grace_length = 1,
	-- Highlight only the column or until the end of the line
	highlight_to_eol = true,
	-- List of filetypes to disable overlength highlighting
	disable_ft = { "qf", "help", "man", "packer", "NvimTree", "Telescope", "WhichKey" },
})
