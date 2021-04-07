local map = require "settings.utils".map
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local exec = vim.api.nvim_exec

g.coc_global_extensions = {
  'coc-actions',
  -- 'coc-css',
  'coc-emmet',
  'coc-git',
  'coc-gitignore',
  'coc-highlight',
  -- 'coc-html',
  'coc-json',
  -- 'coc-lua',
  'coc-pairs',
  -- 'coc-prettier',
  -- 'coc-sh',
  -- 'coc-snippets',
  -- 'coc-solargraph',
  -- 'coc-tabnine',
  -- 'coc-tsserver',
  -- 'coc-vimlsp',
  -- 'coc-yaml',
  'coc-yank',
}

function _G.check_back_space()
  local col = fn.col(".") - 1
  if col == 0 or fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

map("i", "<CR>", 'pumvisible() ? coc#_select_confirm() : "<C-G>u<CR><C-R>=coc#on_enter()<CR>"', {expr = true}, {silent=true})
map("i", "<TAB>", 'pumvisible() ? "<C-N>" : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', {expr = true}, {silent=true})
