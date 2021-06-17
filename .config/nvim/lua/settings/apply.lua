local g, o, bo = vim.g, vim.o, vim.bo
local util, api, cmd, fn, lsp = vim.lsp.util, vim.api, vim.cmd, vim.fn, vim.lsp
local fnamemodify = fn.fnamemodify
local U = {}

local function join(...)
  return table.concat({...}, " ")
end

function U.apply_options(opts)
  for k, v in pairs(opts) do
    if v == true then
      cmd("set " .. k)
    elseif v == false then
      cmd(string.format("set no%s", k))
    else
      cmd(string.format("set %s=%s", k, v))
    end
  end
end

function U.apply_globals(opts)
  for k, v in pairs(opts) do
    g[k] = v
  end
end

-- Usage:
-- hi(Cursor, { fg = bg_dark, bg = yellow })
function U.hi(group, styles)
  -- local command = string.format("hi! %s", group)
  local command = string.format("hi %s", group)
  if styles.bg then
    command = string.format("%s guibg=%s", command, styles.bg)
  end
  if styles.fg then
    command = string.format("%s guifg=%s", command, styles.fg)
  end
  if styles.sp then
      command = string.format("%s guisp=%s", command, styles.sp)
  end
  if styles.cbg then
    command = string.format("%s ctermbg=%s", command, styles.cbg)
  end
  if styles.cfg then
    command = string.format("%s ctermfg=%s", command, styles.cfg)
  end
  if styles.gui then
    command = string.format("%s gui=%s", command, styles.gui)
  end
  cmd(command)
end

-- Usage:
-- highlights({
--      CursorLine   = { bg = bg },
--      Cursor       = { fg = bg_dark, bg = yellow }
-- })
function U.highlights(hi_table)
  for group, styles in pairs(hi_table) do
    U.hi(group, styles)
  end
end

function U.hiLink(src, dest)
  cmd(string.format("hi! link %s %s", src, dest))
end

function U.hiLinks(hi_table)
  for src, dest in pairs(hi_table) do
    U.hiLink(src, dest)
  end
end

return U

