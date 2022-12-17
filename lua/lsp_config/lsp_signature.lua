-- https://github.com/ray-x/lsp_signature.nvim
M = {}

M.setup = function(...) end

local ok, lsp_signature = pcall(require, "lsp_signature")
if ok then
    M.setup = function(_, bufnr) -- (client, bufnr)
        lsp_signature.on_attach({
            bind = true,
            handler_opts = {
                border = "rounded",
            },
            close_timeout = 1500, -- close floating window after ms when last
            -- parameter is entered
            hint_prefix = "🐼 ",
            toggle_key = "<M-x>",
            select_signature_key = "<C-y>",
        }, bufnr)
    end
end

return M
