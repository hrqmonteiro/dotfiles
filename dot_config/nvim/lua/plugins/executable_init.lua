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
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true
	},
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
	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"neovim/nvim-lspconfig",
	"windwp/nvim-autopairs",
	"nvimtools/none-ls.nvim",
	{
		"folke/trouble.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	-- editor
	"tpope/vim-commentary",
	{
		"nvimtools/hydra.nvim",
	},
	-- file management
	{
		'stevearc/oil.nvim',
		opts = {},
	},
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
	"xiyaowong/telescope-emoji.nvim",
	{
		"tomasky/bookmarks.nvim",
		event = "VimEnter",
		config = function()
			require("bookmarks").setup({
				save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
				keywords = {
					["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
					["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
					["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
					["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
				},
				on_attach = function(bufnr)
					local bm = require "bookmarks"
					local map = vim.keymap.set
					map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
					map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
					map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
					map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
					map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
					map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
				end
			})
		end
	},
	-- treesitter
	"nvim-treesitter/nvim-treesitter",
	"windwp/nvim-ts-autotag",
	-- ui
	{
		"Pocco81/true-zen.nvim",
		config = function()
			require("true-zen").setup {
				integrations = {
					lualine = true,
					tmux = true
				}
			}
		end,
	},
	{
		"matbme/JABS.nvim",
		config = function()
			require("jabs").setup()
		end
	},
	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VeryLazy",
	-- 	init = function()
	-- 		vim.o.timeout = true
	-- 		vim.o.timeoutlen = 300
	-- 	end,
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 	}
	-- },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl"
	},
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
require("plugins.hydra")
require("plugins.indent-blankline")
require("plugins.lsp-config")
require("plugins.lualine")
require("plugins.mason")
require("plugins.neo-tree")
require("plugins.null-ls")
require("plugins.nvim-autopairs")
require("plugins.nvim-cmp")
require("plugins.nvim-treesitter")
require("plugins.nvim-ufo")
require("plugins.telescope")
-- require("plugins.which-key")
