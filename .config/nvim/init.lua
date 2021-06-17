vim.cmd([[
au BufNewFile,BufRead *.json.jbuilder set ft=ruby
]])

vim.cmd 'set termguicolors'
vim.cmd 'syntax on'
vim.cmd 'colorscheme nord'
vim.cmd 'set updatetime=250'

require 'settings'
require 'plugins'
require 'lsp'

vim.cmd 'packadd paq-nvim'
local paq = require'paq-nvim'.paq
paq {'savq/paq-nvim', opt = true}

-- paq 'maxmellon/vim-jsx-pretty'
-- paq 'herringtondarkholme/yats.vim'
paq 'arzg/vim-substrata'
-- paq 'ahmedkhalf/lsp-rooter.nvim'
paq 'akinsho/nvim-toggleterm.lua'
paq 'brooth/far.vim'
paq 'folke/tokyonight.nvim'
paq 'glepnir/dashboard-nvim'
paq 'glepnir/galaxyline.nvim'
paq 'glepnir/lspsaga.nvim'
paq 'hrsh7th/nvim-compe'
paq 'hrsh7th/vim-vsnip'
paq 'hrsh7th/vim-vsnip-integ'
paq 'karb94/neoscroll.nvim'
paq 'kevinhwang91/nvim-hlslens'
paq 'kyazdani42/nvim-tree.lua'
paq 'kyazdani42/nvim-web-devicons'
paq 'lewis6991/gitsigns.nvim'
paq 'liuchengxu/vista.vim'
paq {'lukas-reineke/indent-blankline.nvim', branch='lua'}
-- paq 'lukelbd/vim-toggle'
paq 'mattn/emmet-vim'
paq 'neovim/nvim-lspconfig'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-lua/popup.nvim'
paq 'nvim-telescope/telescope.nvim'
paq 'nvim-treesitter/nvim-treesitter'
paq 'nvim-treesitter/nvim-treesitter-refactor'
paq 'ojroques/vim-oscyank'
paq 'onsails/lspkind-nvim'
paq 'rafamadriz/friendly-snippets'
paq {'RRethy/vim-hexokinase', run = 'make hexokinase'}
paq 'romgrk/barbar.nvim'
paq 'sbdchd/neoformat'
paq 'terrortylor/nvim-comment'
paq 'hrqmonteiro/neogit'
paq 'tveskag/nvim-blame-line'
-- paq {'tzachar/compe-tabnine', run = './install.sh'}
paq 'windwp/nvim-autopairs'
paq 'windwp/nvim-ts-autotag'
paq 'ygm2/rooter.nvim'
