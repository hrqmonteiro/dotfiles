return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "SmiteshP/nvim-navic"
    },
    config = function()
      require("neodev").setup({})

      local navic = require("nvim-navic")
      local servers = require("modules.lsp.servers")
      local lspconfig = require("lspconfig")

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- local on_attach = function(client, bufnr)
      --   if client.server_capabilities.documentSymbolProvider then
      --     navic.attach(client, bufnr)
      --   end
      -- end

      -- for _, server in ipairs(servers) do
      --   lspconfig[server].setup {
      --     capabilities = capabilities,
      --     on_attach = on_attach
      --   }
      -- end

      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          navic.attach(client, bufnr)
        end
      })

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            }
          }
        }
      })

      vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end
  }
}
