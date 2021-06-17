local galaxyline = require("galaxyline")
local condition = require("galaxyline.condition")
local diagnostic = require("galaxyline.provider_diagnostic")
local vcs = require("galaxyline.provider_vcs")
local fileinfo = require("galaxyline.provider_fileinfo")
local colors = require("plugins.colors")
local icons = require("plugins.icons")

-- shorten lines for these filetypes
galaxyline.short_line_list = {
  "floaterm",
  "term",
  "NvimTree",
}

local modes = {
  n = {"N", colors.blue},
  v = {"V", colors.magenta},
  V = {"V", colors.magenta},
  [""] = {"V", colors.magenta},
  s = {"S", colors.orange},
  S = {"S", colors.orange},
  [""] = {"S", colors.orange},
  i = {"I", colors.green},
  R = {"R", colors.red},
  c = {"C", colors.orange},
  r = {"P", colors.brown},
  ["!"] = {"E", colors.purple},
  t = {"T", colors.purple}
}

local get_vim_mode_style = function()
  local vim_mode = vim.fn.mode()
  return modes[vim_mode]
end

local get_filename = function()
  return vim.fn.expand("%:h:t") .. "/" .. vim.fn.expand("%:t")
end

local file_readonly = function(readonly_icon)
  if vim.bo.filetype == "help" then
    return ""
  end
  local icon = readonly_icon or ""
  if vim.bo.readonly == true then
    return " " .. icon .. " "
  end
  return ""
end

local current_file_name_provider = function()
  local file = get_filename()
  if vim.fn.empty(file) == 1 then
    return ""
  end
  if string.len(file_readonly()) ~= 0 then
    return file .. file_readonly()
  end
  local icon = ""
  if vim.bo.modifiable then
    if vim.bo.modified then
      return file .. " " .. icon .. "  "
    end
  end
  return file .. " "
end

local sectionCount = {
  left = 0,
  mid = 0,
  right = 0,
  short_line_left = 0,
  short_line_right = 0
}

local nextSectionNum = function(sectionKind)
  local num = sectionCount[sectionKind] + 1
  sectionCount[sectionKind] = num
  return num
end

local addSection = function(sectionKind, section)
  local num = nextSectionNum(sectionKind)
  local id = sectionKind .. "_" .. num .. "_" .. section.name
  -- note: this is needed since id's get mapped to highlights name `Galaxy<Id>`
  if (section.useNameAsId == true) then
    id = section.name
  end
  galaxyline.section[sectionKind][num] = {
    [id] = section
  }
end

local addSections = function(sectionKind, sections)
  for _, section in pairs(sections) do
    addSection(sectionKind, section)
  end
end

local string_provider = function(str)
  return function()
    return str
  end
end

local createSpaceSection = function(color)
  return {
    name = "whitespace",
    provider = string_provider(" "),
    highlight = {color, color}
  }
end

addSections(
  "left",
  {
    {
      name = "ViMode",
      useNameAsId = true,
      provider = function()
        -- auto change color according the vim mode
        local modeStyle = get_vim_mode_style()
        vim.api.nvim_command("hi GalaxyViMode guibg=" .. modeStyle[2])
        return icons.sep.space .. modeStyle[1] .. icons.sep.space
      end,
      highlight = {colors.bg, colors.fg_gutter, "bold"}
    },
    {
      name = "ViModeRightCap",
      useNameAsId = true,
      provider = function()
        local modeStyle = get_vim_mode_style()
        vim.api.nvim_command("hi GalaxyViModeRightCap guifg=" .. modeStyle[2])
        return icons.sep.right
      end,
      highlight = {colors.bg, colors.fg_gutter}
    },
    {
      name = "gitBranch",
      provider = "GitBranch",
      condition = require("galaxyline.provider_vcs").check_git_workspace,
      highlight = {colors.blue, colors.fg_gutter},
    },
    {
      name = "fileLeftCap",
      provider = string_provider(icons.sep.right),
      condition = require("galaxyline.provider_vcs").check_git_workspace,
      highlight = {colors.fg_gutter, colors.bg_dark},
    },
    createSpaceSection(colors.bg_dark),
    {
      name = "fileIcon",
      provider = {"FileIcon"},
      condition = condition.buffer_not_empty,
      highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg_dark},
      -- separator = " ",
      -- separator_highlight = {colors.fg, colors.bg_dark}
    },
    {
      name = "fileName",
      provider = current_file_name_provider,
      condition = condition.buffer_not_empty,
      highlight = {colors.fg, colors.bg_dark},
      -- separator = " ",
      -- separator_highlight = {colors.fg, colors.bg_dark}
    },
  }
)

addSections(
  "right",
  {
    {
   name = "lineColumn",
   provider = {"LineColumn"},
   condition = condition.buffer_not_empty,
   separator = icons.sep.left,
   separator_highlight = {colors.fg_gutter, colors.bg_dark},
   highlight = {colors.fg_dark, colors.fg_gutter},
   },
   {
    name = "linePercent",
    provider = "LinePercent",
    separator = icons.sep.left,
    separator_highlight = {colors.blue, colors.fg_gutter},
    highlight = {colors.bg, colors.blue},
   }
  }
)

addSections(
  "short_line_left",
  {
      createSpaceSection(colors.blue),
      {
          name = "bufferIcon",
          provider = "FileIcon",
          highlight = {colors.bg, colors.blue},
          separator = "",
          separator_highlight = {colors.blue, colors.blue}
      },
    {
      name = "bufferIconSeparator",
      provider = string_provider(icons.sep.right),
      condition = require("galaxyline.provider_vcs").check_git_workspace,
      highlight = {colors.blue, colors.bg_dark},
    },
    createSpaceSection(colors.bg_dark),
    {
        name = "fileName",
        provider = "FileName",
        highlight = {colors.fg_dark, colors.bg_dark},
    }
  }
)

addSections(
  "short_line_right",
  {}
)
