vim.api.nvim_exec([[
" source $HOME/.config/nvim/vimscript/functions.vim
let g:Illuminate_ftblacklist = ['NvimTree']
let g:Illuminate_delay = 500
]], "")

vim.cmd([[
autocmd ColorScheme * highlight NvimTreeBg guibg=#323846 guifg=#D8DEE9 gui=none | highlight CursorLineNvimTree guibg=#88C0D0 guifg=#2E3440 gui=none
autocmd FileType NvimTree setlocal winhighlight=CursorLine:CursorLineNvimTree
]])

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

paq 'airblade/vim-rooter'
paq 'AndrewRadev/tagalong.vim'
paq 'brooth/far.vim'
paq 'glepnir/galaxyline.nvim'
paq 'glepnir/lspsaga.nvim'
paq 'hrsh7th/nvim-compe'
paq 'hrsh7th/vim-vsnip'
paq 'hrsh7th/vim-vsnip-integ'
paq 'karb94/neoscroll.nvim'
paq 'kevinhwang91/nvim-hlslens'
paq 'kyazdani42/nvim-tree.lua'
paq 'kyazdani42/nvim-web-devicons'
paq 'kdav5758/TrueZen.nvim'
paq 'lewis6991/gitsigns.nvim'
paq {'lukas-reineke/indent-blankline.nvim', branch='lua'}
paq 'lukelbd/vim-toggle'
paq 'mattn/emmet-vim'
paq 'neovim/nvim-lspconfig'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-lua/popup.nvim'
paq 'nvim-telescope/telescope.nvim'
paq 'nvim-treesitter/nvim-treesitter'
paq 'nvim-treesitter/nvim-treesitter-refactor'
paq 'nvim-treesitter/nvim-tree-docs'
paq 'ojroques/vim-oscyank'
paq 'onsails/lspkind-nvim'
paq 'Pablo1107/codi.vim'
paq 'rafamadriz/friendly-snippets'
paq {'RRethy/vim-hexokinase', run = 'make hexokinase'}
paq 'RRethy/vim-illuminate'
paq 'romgrk/barbar.nvim'
paq 'sbdchd/neoformat'
paq 'styled-components/vim-styled-components'
paq 'terrortylor/nvim-comment'
paq 'TimUntersberger/neogit'
paq 'tveskag/nvim-blame-line'
paq {'tzachar/compe-tabnine', run = './install.sh'}
paq 'Valloric/MatchTagAlways'
paq 'voldikss/vim-floaterm'
paq 'windwp/nvim-autopairs'
