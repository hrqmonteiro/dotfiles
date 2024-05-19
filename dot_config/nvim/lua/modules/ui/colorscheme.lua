return {
  {
    "gbprod/nord.nvim",
    -- "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme nord")
      vim.cmd("hi! link HydraBorder StatusLine")
      vim.cmd("hi! link HydraHint StatusLine")
      vim.cmd("hi! link NormalFloat StatusLine")
    end,
  }
}
