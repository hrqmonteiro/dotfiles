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
          separator = "⇝ "
        }
      })
    end
  }
}
