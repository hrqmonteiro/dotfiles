-- :fennel:1748868599
local function _1_()
  local dropbar_api = require("dropbar.api")
  vim.keymap.set("n", "<Leader>;", dropbar_api.pick, {desc = "Pick symbols in winbar"})
  vim.keymap.set("n", "[;", dropbar_api.goto_context_start, {desc = "Go to start of current context"})
  return vim.keymap.set("n", "];", dropbar_api.select_next_context, {desc = "Select next context"})
end
return {{"Bekaboo/dropbar.nvim", config = _1_, dependencies = {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}}}