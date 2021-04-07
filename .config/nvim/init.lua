vim.cmd([[
autocmd ColorScheme * highlight NvimTreeBg guibg=#323846 guifg=#D8DEE9 gui=none | highlight CursorLineNvimTree guibg=#88C0D0 guifg=#2E3440 gui=none
autocmd FileType NvimTree setlocal winhighlight=Normal:NvimTreeNormal
autocmd! User GoyoEnter lua require('galaxyline').disable_galaxyline()
autocmd! User GoyoLeave lua require('galaxyline').galaxyline_augroup()
]])

vim.api.nvim_exec([[
" source $HOME/.config/nvim/vimscript/functions.vim
let g:Illuminate_ftblacklist = ['NvimTree', 'help', 'dashboard', 'NeogitStatus']
let g:Illuminate_delay = 500
]], "")

vim.cmd 'set termguicolors'
vim.cmd 'colorscheme nord'
vim.cmd 'syntax enable'

-- require 'nv-utils'
require 'settings'
require 'plugins'
require 'lsp'

vim.cmd 'packadd paq-nvim'
local paq = require'paq-nvim'.paq
paq {'savq/paq-nvim', opt = true}

-- paq 'ayu-theme/ayu-vim'
paq 'neovim/nvim-lspconfig'
paq 'bakpakin/fennel.vim'
paq 'brooth/far.vim'
-- paq 'ChristianChiarulli/nvcode-color-schemes.vim'
paq 'dstein64/vim-startuptime'
paq 'doums/darcula'
paq 'glepnir/dashboard-nvim'
paq 'glepnir/lspsaga.nvim'
paq 'hrsh7th/nvim-compe'
paq 'hrsh7th/vim-vsnip'
paq 'hrsh7th/vim-vsnip-integ'
paq 'hrqmonteiro/galaxyline.nvim'
paq 'junegunn/goyo.vim'
-- paq 'kabouzeid/nvim-lspinstall'
paq 'karb94/neoscroll.nvim'
paq 'kevinhwang91/nvim-hlslens'
paq 'kyazdani42/nvim-tree.lua'
paq 'kyazdani42/nvim-web-devicons'
paq 'lewis6991/gitsigns.nvim'
paq {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
paq 'mattn/emmet-vim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-lua/popup.nvim'
paq 'nvim-telescope/telescope.nvim'
-- paq 'nvim-telescope/telescope-media-files.nvim'
paq 'nvim-treesitter/nvim-treesitter'
paq 'nvim-treesitter/nvim-treesitter-refactor'
paq 'nvim-treesitter/nvim-tree-docs'
paq 'ojroques/vim-oscyank'
paq 'Olical/aniseed'
paq 'onsails/lspkind-nvim'
paq 'p00f/nvim-ts-rainbow'
paq {'pineapplegiant/spaceduck', branch = 'main' }
-- paq 'psliwka/vim-smoothie'
paq {'RRethy/vim-hexokinase', run = 'make hexokinase'}
paq 'RRethy/vim-illuminate'
paq 'romgrk/barbar.nvim'
-- paq 'skywind3000/vim-keysound'
paq 'hrqmonteiro/neogit'
paq 'TaDaa/vimade'
paq 'terrortylor/nvim-comment'
paq 'toniz4/vim-stt'
-- paq 'tveskag/nvim-blame-line'
-- paq {'tzachar/compe-tabnine', run = './install.sh'}
paq 'windwp/nvim-autopairs'
-- paq 'windwp/nvim-ts-autotag'
