local apply_options = require("settings.apply").apply_options

apply_options (
  {
    clipboard = "unnamedplus",
    cmdheight = 1,
    cursorline = true,
    expandtab = true,
    fillchars = "vert::",
    incsearch = true,
    hidden = true,
    laststatus = 2,
    -- linespace = 1,
    mouse = "nv",
    backup = false,
    showmode = false,
    swapfile = false,
    number = true,
    relativenumber = false,
    shiftwidth = 2,
    -- shortmess = "filnxtToOFIWc",
    signcolumn = "yes",
    smartindent = true,
    smarttab = true,
    syntax = "on",
    splitbelow = true,
    splitright = true,
    t_Co = "256",
    conceallevel = 0,
    wildmenu = true,
  }
)

vim.cmd('set autochdir')
vim.cmd('set shortmess+=c')
vim.cmd('set ts=4')
vim.cmd('set colorcolumn=99999')
