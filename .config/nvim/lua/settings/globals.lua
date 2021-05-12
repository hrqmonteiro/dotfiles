local g = vim.g
local cmd = vim.cmd
local apply_globals = require "settings.apply".apply_globals

-- cmd 'filetype plugin indent on'

apply_globals (
  {
    Hexokinase_highlighters = {"virtual"},
  }
)

--[[ AUTO_COMPLETE=true
AUTO_FORMAT=true ]]
