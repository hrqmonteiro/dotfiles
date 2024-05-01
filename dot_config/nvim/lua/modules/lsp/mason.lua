return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local servers = require("modules.lsp.servers")
      local tools = require("modules.lsp.tools")

      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = servers
      })

      require("mason-tool-installer").setup({
        ensure_installed = tools
      })
    end
  }
}
