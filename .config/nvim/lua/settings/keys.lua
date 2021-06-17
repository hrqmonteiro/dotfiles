local g = vim.g
local map = vim.api.nvim_set_keymap
local keymap = vim.api.nvim_buf_set_keymap

map('n', '<Space>', '<Nop>', {noremap = true, silent = true})
g.mapleader = ' '

map('n', '<C-b>', ':NvimTreeToggle<CR>', {silent = true})
map('n', '<C-f>', ':Telescope find_files<CR>', {silent = true})
map('n', '<C-`>', ':Toggle<CR>', {silent = true})
map('n', '<C-t>', ':ToggleTerm<CR>', {noremap = true, silent = true})
map('n', '<C-s>', ':Neoformat prettier<CR>', {noremap = true, silent = true})
map('n', '<C-g>', ':TZAtaraxis<CR>', {noremap = true, silent = true})
map('n', '<Leader>.', ':Telescope file_browser<CR>', {silent = true})
map('n', '<Leader>ff', ':Telescope find_files<CR>', {silent = true})
map('n', '<Leader>fr', ':Telescope oldfiles<CR>', {silent = true})
map('n', '<Leader>cc', ':Telescope colorscheme<CR>', {silent = true})
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})
map('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
map('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})
map('n', '<C-c>', ':OSCYank<CR>', {noremap = true, silent = true})
map('n', '<Leader>tb', ':ToggleBlameLine<CR>', {noremap = true, silent = true})
map('n', '<Leader>ti', ':IndentBlanklineToggle<CR>', {noremap = true, silent = true})
map('n', '<Leader>tc', ':HexokinaseToggle<CR>', {noremap = true, silent = true})
map('n', '<Leader>tg', ':Gitsigns toggle_signs<CR>', {noremap = true, silent = true})
keymap(0, 'n', '<Leader>gg', "<cmd>lua require'neogit.status'.create('split')<cr>", {noremap = true, silent = true});

map('n', '<A.<>', ':BufferMovePrevious', {noremap = true, silent = true})
map('n', '<A.>>', ':BufferMoveNext', {noremap = true, silent = true})
