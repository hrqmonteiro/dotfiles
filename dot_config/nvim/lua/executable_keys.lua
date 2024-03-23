local g = vim.g
local map = vim.keymap
g.mapleader = ' '
g.maplocalleader = ' '

map.set('n', '<Space>', '<Nop>', { noremap = true, silent = true })
map.set('n', '<Leader>op', ':Neotree toggle<CR>', { noremap = true, silent = true })
map.set('n', '<Leader>ff', ':Telescope find_files hidden=true<CR>', { silent = true })
map.set('n', '<Leader>fw', ':Telescope live_grep<CR>', { silent = true })
map.set('n', '<Leader>gg', ':LazyGit<CR>', { silent = true })
map.set('n', '<Leader>n', ':NnnPicker<CR>', { silent = true })
