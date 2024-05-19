return {
  {
    "romgrk/barbar.nvim",
    config = function()
      require("barbar").setup({
        auto_hide = false,
        tabpages = false
      })
    end
  }
}
