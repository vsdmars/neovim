-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    print('"neovim/nvim-lspconfig" not available')
    return
end

-- https://github.com/williamboman/mason.nvim
local ok, mason = pcall(require, "mason")
if not ok then
    print("'mason' not available")
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


local ok, mason_conf = pcall(require, "mason-lspconfig")
if not ok then
    print("'mason-lspconfig' not available")
    return
end

-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
mason_conf.setup({
    -- ensure_installed = { "jsonls", "vimls", "taplo", "dockerls", "neocmake", "sumneko_lua", "rust_analyzer", "clangd", "pyright" },
    ensure_installed = { "sumneko_lua", "rust_analyzer", "clangd", "pyright" },
    automatic_installation = true,
})
--[[ mason_conf.setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["rust_analyzer"] = function ()
            require("rust-tools").setup {}
        end
}
]]

-- setup diagnostics under lsp_config directory
local diagnostics = require("lsp_config.diagnostics")
diagnostics.setup()

-- setup main language lsp under lsp_config/servers directory
require("lsp_config.servers.clangd").setup()
require("lsp_config.servers.sumneko_lua").setup()
require("lsp_config.servers.rust_analyzer").setup()

-- setup language lsp as general 
local setup_lsp = function()
    local lsp_handlers = require("lsp_config.lsp_handlers")
    lsp_handlers.setup()

    local opts = {
        on_attach = function(client, bufnr)
            lsp_handlers.set_mappings(client, bufnr)
            lsp_handlers.set_autocmds(client, bufnr)
            lsp_handlers.set_additional_plugins(client, bufnr)
            diagnostics.set_mappings(client, bufnr)
        end,
        capabilities = lsp_handlers.capabilities,
    }

    for _, server in ipairs({
        "bashls",
        "dockerls",
        "jsonls",
        "neocmake",
        "pyright",
        "taplo",
        "tsserver",
        "vimls",
        "yamlls",
    }) do
        lspconfig[server].setup(opts)
    end
end

setup_lsp()
