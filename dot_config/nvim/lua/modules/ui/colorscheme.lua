return {
  {
    -- "gbprod/nord.nvim",
    -- "sainnhe/everforest",
    -- "olivercederborg/poimandres.nvim",
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin")
      -- vim.cmd("hi! link HydraBorder StatusLine")
      -- vim.cmd("hi! link HydraHint StatusLine")
      -- vim.cmd("hi! link NormalFloat StatusLine")
    end,
  }
}
