-- :fennel:1748716597
local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
local modules = require("modules")
local _local_1_ = require("functions")
local create_spec_from_map = _local_1_["create-spec-from-map"]
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "--single-branch", "https://github.com/folke/lazy.nvim.git", lazypath})
else
end
vim.opt.runtimepath:prepend(lazypath)
local lazy = require("lazy")
return lazy.setup({spec = create_spec_from_map(modules)})