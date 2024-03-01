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
  -- {
  --   "ActivityWatch/aw-watcher-vim",
  --   lazy = false,
  --   priority = 1000
  -- },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },
  "lewis6991/gitsigns.nvim",
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme solarized")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        vim.cmd("colorscheme solarized")
      end,
    },
  },
  {
    "ishan9299/nvim-solarized-lua",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[ colorscheme solarized ]])
    end
  },
  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  -- lsp
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  "windwp/nvim-autopairs",
  "nvimtools/none-ls.nvim",
  -- editor
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
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
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { { "nvim-tree/nvim-web-devicons" } }
  },
}

require("lazy").setup(plugins, opts)
require("plugins.gitsigns")
require("plugins.lsp-config")
require("plugins.lualine")
require("plugins.neo-tree")
require("plugins.null-ls")
require("plugins.nvim-autopairs")
require("plugins.nvim-cmp")
require("plugins.nvim-treesitter")
