return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()

      vim.diagnostic.config({
        signs = false,
        virtual_text = false,
      })
    end
  }
}
