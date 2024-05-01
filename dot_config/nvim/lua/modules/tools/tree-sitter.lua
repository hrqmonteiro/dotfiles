return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        autotag = {
          enable = true
        },
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        }
      })
    end
  }
}
