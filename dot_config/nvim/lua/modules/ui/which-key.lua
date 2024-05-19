return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function()
      require("which-key").setup({
        icons = {
          breadcrumb = "⟶ ",
          separator = "⟶ "
        },
        layout = {
          align = "left",
          -- height = {
          --   min = 6,
          --   max = 25
          -- },
          -- spacing = 2,
          -- width = {
          --   min = 38,
          --   max = 38
          -- }
        }
      })
    end
  }
}
