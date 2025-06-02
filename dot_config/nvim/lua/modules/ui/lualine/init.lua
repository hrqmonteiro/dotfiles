-- :fennel:1748870534
local options = {always_divide_middle = true, component_separators = {left = "", right = ""}, disabled_filetypes = {statusline = {}, winbar = {}}, extensions = {"lazy", "mason", "neo-tree"}, globalstatus = true, icons_enabled = true, ignore_focus = {}, refresh = {statusline = 100, tabline = 100, winbar = 100}, section_separators = {left = "", right = ""}, theme = "auto"}
local function border(padding)
  local function _1_()
    return " "
  end
  return {_1_, color = {fg = ""}, padding = padding, separator = ""}
end
local function hide_in_width()
  local window_width_limit = 100
  return (vim.o.columns < window_width_limit)
end
local hidden_filetypes = {"aerial", "dapui_breakpoints", "dapui_console", "dapui_hover", "dapui_scopes", "dapui_stacks", "dapui_watches", "edgy", "harpoon", "neo-tree", "neo-tree-popup", "NeogitCommitSelectView", "NeogitCommitView", "NeogitConsole", "NeogitDiffView", "NeogitGitCommandHistory", "NeogitLogView", "NeogitPopup", "NeogitRebaseTodo", "Neogitreflogview", "Neogitrefsview", "NeogitStatus", "neotest-output-panel", "neotest-summary", "nvimtree", "overseerform", "overseerlist"}
local function file_name_component()
  local home = vim.fn.expand("~")
  local full_path = vim.fn.expand("%:p")
  local modified_highlight = "lualine_c_diff_removed_normal"
  local file_icon = "\243\176\134\147"
  local current_filetype = vim.bo.filetype
  local modified = vim.bo.modified
  local display_path = nil
  if (vim.fn.empty(full_path) == 1) then
    display_path = vim.fn.getcwd()
  else
    display_path = full_path
  end
  if (display_path:sub(1, #home) == home) then
    display_path = ("~" .. display_path:sub((#home + 1)))
    if (display_path == "~") then
      display_path = "~/"
    else
    end
  else
  end
  if vim.tbl_contains(hidden_filetypes, current_filetype) then
    local ___antifnl_rtn_1___ = ((modified and ("%#" .. modified_highlight .. "#" .. file_icon .. " " .. display_path)) or display_path)
    local ___antifnl_rtn_1___0 = ___antifnl_rtn_1___
    return ___antifnl_rtn_1___
  else
  end
  if hide_in_width() then
    local file_name = vim.fn.expand("%:t")
    local ___antifnl_rtn_1___ = ((modified and ("%#" .. modified_highlight .. "#" .. file_icon .. " " .. file_name)) or file_name)
    local ___antifnl_rtn_1___0 = ___antifnl_rtn_1___
    return ___antifnl_rtn_1___
  else
  end
  return ((modified and ("%#" .. modified_highlight .. "#" .. file_icon .. " " .. display_path)) or display_path)
end
local function mode_component()
  local mode = vim.fn.mode()
  local mode_map = {["\22"] = "V-BLK", R = "REP", V = "V-LINE", c = "CMD", i = "INS", n = "NOR", s = "SEA", t = "TER", v = "VIS"}
  return (mode_map[mode] or mode)
end
local lsp_icons = {bashls = "\238\175\138", clangd = "\243\176\153\133", csharp_ls = "\243\176\140\155", cssls = "\238\157\137", dartls = "\238\158\152", denols = "\243\176\155\166", dockerls = "\243\176\161\168", elixirls = "\243\177\136\153", eslint = "\243\176\177\186", fennel_ls = "\238\154\175", gopls = "\243\176\159\147", hls = "\243\176\159\181", html = "\243\176\140\157", jdtls = "\238\156\184", kotlin_language_server = "\243\176\140\185", lua_ls = "\243\176\162\177", marksman = "\238\152\137", metals = "\238\152\154", phpactor = "\243\176\140\181", powershell_es = "\238\158\149", pylsp = "\243\176\140\160", pyright = "\243\176\140\160", rust_analyzer = "\238\158\168", scssls = "\238\158\182", sqlls = "\243\176\190\183", stylua = "\243\176\162\177", sumneko_lua = "\243\176\162\177", tailwindcss = "\238\162\186", templ = "\243\176\133\180", terraformls = "\243\176\147\167", ts_ls = "\243\176\155\166", volar = "\243\176\161\187", yamlls = "\243\176\155\153"}
local function lsp_server_component()
  if hide_in_width() then
    return ""
  else
  end
  local clients = vim.lsp.get_clients({bufnr = 0})
  local parts = {}
  for _, client in ipairs(clients) do
    local icon = lsp_icons[client.name]
    if icon then
      table.insert(parts, (icon .. "  "))
    else
      table.insert(parts, (client.name .. " "))
    end
  end
  if (#parts == 0) then
    return " "
  else
    return table.concat(parts)
  end
end
local function git_branch_component()
  local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
  local branch_name = handle:read("*a"):gsub("%s+", "")
  handle:close()
  if (branch_name == "") then
    return ""
  else
  end
  local branch_icon = "\239\144\152"
  local branch_highlight = "lualine_b_normal"
  return (branch_icon .. " " .. branch_name)
end
local function has_file_opened()
  return ((vim.bo.filetype ~= "") and (vim.fn.expand("%:p") ~= ""))
end
local sections = {lualine_a = {mode_component}, lualine_b = {}, lualine_c = {{"filename"}, {"navic"}}, lualine_x = {{"diagnostics", sections = {"error", "hint", "warn", "info"}, always_visible = false}, lsp_server_component, git_branch_component}, lualine_y = {}, lualine_z = {}}
return {{"nvim-lualine/lualine.nvim", opts = {options = options, sections = sections}}}