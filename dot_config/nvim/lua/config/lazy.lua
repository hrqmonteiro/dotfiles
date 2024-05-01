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

require("lazy").setup(
  {
    spec = {
      { import = "modules.completion" },
      { import = "modules.editor" },
      { import = "modules.lsp" },
      { import = "modules.ui" },
      { import = "modules.tools" },
    }
  },
  {}
)
