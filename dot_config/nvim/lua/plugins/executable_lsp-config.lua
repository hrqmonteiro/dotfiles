local servers = require("servers")

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers
})

local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    capabilities = capabilities
  }
end
