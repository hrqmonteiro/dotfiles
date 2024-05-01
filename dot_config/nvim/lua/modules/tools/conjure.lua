return {
  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "python" }, -- etc
    -- [Optional] cmp-conjure for cmp
    dependencies = {
      'tpope/vim-dispatch',
      'clojure-vim/vim-jack-in',
      'radenling/vim-dispatch-neovim',
    },
    config = function(_, opts)
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()
    end,
    init = function()
      vim.g["conjure#debug"] = false
    end,
  },
}
