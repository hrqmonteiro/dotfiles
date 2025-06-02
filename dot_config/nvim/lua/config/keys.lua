-- :fennel:1748791140
local map = vim.keymap.set
return map("n", "<Leader><Leader>", ":Telescope find_files<CR>", {desc = "Search files"})