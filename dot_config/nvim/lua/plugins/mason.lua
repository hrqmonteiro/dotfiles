local servers = require("servers")
local tools = require("tools")

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = servers
})

require("mason-tool-installer").setup({
  ensure_installed = tools
})
