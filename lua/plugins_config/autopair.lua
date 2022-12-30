-- https://github.com/windwp/nvim-autopairs

local ok, autop = pcall(require, "nvim-autopairs")
if not ok then
	if PLUGIN_MISSING_NOTIFY then
		print('"windwp/nvim-autopairs.nvim" not available')
	end
	return
end

autop.setup()
