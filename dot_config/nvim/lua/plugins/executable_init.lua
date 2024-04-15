local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local opts = {}

local plugins = {
  -- tmux support
  "christoomey/vim-tmux-navigator",
  -- clojure
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
      -- Set configuration options here
      vim.g["conjure#debug"] = false
    end,
  },
  -- git
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- color scheme
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[ colorscheme catppuccin-macchiato ]])
    end
  },
  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "PaterJason/cmp-conjure",
  -- lsp
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  "windwp/nvim-autopairs",
  "nvimtools/none-ls.nvim",
  -- editor
  "tpope/vim-commentary",
  -- file management
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    }
  },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } }
  },
  -- treesitter
  "nvim-treesitter/nvim-treesitter",
  "windwp/nvim-ts-autotag",
  -- ui
  {
    'stevearc/dressing.nvim',
    opts = {},
    config = function()
      require("dressing").setup()
    end
  },
  "nvim-tree/nvim-web-devicons",
  "goolord/alpha-nvim",
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
  },
}

require("lazy").setup(plugins, opts)
require("plugins.nvim-web-devicons")
require("plugins.alpha")
require("plugins.gitsigns")
require("plugins.lsp-config")
require("plugins.lualine")
require("plugins.neo-tree")
require("plugins.null-ls")
require("plugins.nvim-autopairs")
require("plugins.nvim-cmp")
require("plugins.nvim-treesitter")
require("plugins.nvim-ufo")
require("plugins.telescope")
