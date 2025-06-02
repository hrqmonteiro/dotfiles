-- :fennel:1748790868
local function _1_()
  local telescope = require("telescope")
  local function _2_(_)
    return {"--hidden"}
  end
  return telescope.setup({defaults = {dynamic_preview_title = true, hidden = true, entry_prefix = "  ", file_ignore_patterns = {".git/", "^node_modules/"}, layout_config = {height = 0.8, horizontal = {preview_cutoff = 120, preview_width = 0.55, prompt_position = "top", vertical = {mirror = false}, width = 0.8}}, border = {}, layout_strategy = "flex", prompt_prefix = " \238\173\168  ", selection_caret = "  ", sorting_strategy = "ascending"}, pickers = {find_files = {hidden = true}, oldfiles = {hidden = true, prompt_title = "Recent Files"}, live_grep = {additional_args = _2_, prompt_title = "Search Text"}}})
end
return {{"nvim-telescope/telescope.nvim", config = _1_}}