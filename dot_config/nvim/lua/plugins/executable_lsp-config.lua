local servers = require("servers")
local lspconfig = require("lspconfig")

capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    capabilities = capabilities
  }
end

