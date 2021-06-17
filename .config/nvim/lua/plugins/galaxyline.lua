local cmd = vim.cmd
local gl = require("galaxyline")
local fn = vim.fn
local section = gl.section
gl.short_line_list = {"NvimTree", "packager", "Floaterm", "NeogitStatus", "vista", "vista_kind"}
local condition = require('galaxyline.condition')

local colors = {
    nordbg = "#323846",
    nord1 = "#3B4252",
    nord0 = "#2E3440",
    nord2 = "#434C5E",
    nord3 = "#4C566A",
    nord3_bright = "#616E88",
    nord4 = "#D8DEE9",
    nord5 = "#E5E9F0",
    nord6 = "#ECEFF4",
    nord7 = "#8FBCBB",
    nord8 = "#88C0D0",
    nord9 = "#81A1C1",
    nord10 = "#5E81AC",
    nord11 = "#BF616A",
    nord12 = "#D08770",
    nord13 = "#EBCB8B",
    nord14 = "#A3BE8C",
    nord15 = "#B48EAD"
}

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

section.left[1] = {
  FirstElement = {
    -- provider = function() return '▊ ' end,
    provider = function()
      return "   "
    end,
    highlight = {colors.nord9, colors.nordbg}
  }
}

-- section.left[3] = {
--   GitIcon = {
--     provider = function()
--       return " "
--     end,
--     condition = require("galaxyline.provider_vcs").check_git_workspace,
--     separator = "",
--     highlight = {colors.nord4, colors.nordbg}
--   }
-- }

section.left[4] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    separator = "  ",
    separator_highlight = {colors.nord15, colors.nordbg},
    highlight = {colors.nord4, colors.nordbg, "bold"}
  }
}

section.left[5] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    -- separator = " ",
    icon = " ",
    highlight = {colors.nord4, colors.nordbg},
    separator_highlight = {colors.nordbg, colors.nordbg}
  }
}

section.left[6] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    separator = " ",
    icon = " ",
    highlight = {colors.nord4, colors.nordbg},
    separator_highlight = {colors.nordbg, colors.nordbg}
  }
}

section.left[7] = {
DiffTotal = {
   provider = "DiffTotal",
   separator = "",
   highlight = {colors.nord4, colors.nordbg},
   separator_highlight = {'NONE', colors.nordbg},
 }
}

-- section.left[7] = {
--   DiagnosticInfo = {
--     -- separator = " ",
--     provider = "DiagnosticInfo",
--     icon = " ",
--     highlight = {colors.nord4, colors.nordbg},
--     separator_highlight = {colors.nordbg, colors.nordbg}
--   }
-- }
--
-- section.left[8] = {
--   DiagnosticHint = {
--     provider = "DiagnosticHint",
--     -- separator = " ",
--     icon = " ",
--     highlight = {colors.nord4, colors.nordbg},
--     separator_highlight = {colors.nordbg, colors.nordbg}
--   }
-- }

-- local checkwidth = function()
--   local squeeze_width = fn.winwidth(0) / 2
--   if squeeze_width > 40 then
--     return true
--   end
--   return false
-- end

-- section.right[3] = {
--   DiffAdd = {
--     provider = "DiffAdd",
--     condition = checkwidth,
--     icon = " ",
--     highlight = {colors.nord14, nord_colors.line_bg}
--   }
-- }

-- section.right[4] = {
--   DiffModified = {
--     provider = "DiffModified",
--     condition = checkwidth,
--     icon = "柳",
--     highlight = {colors.nord13w, nord_colors.line_bg}
--   }
-- }

-- section.right[5] = {
--   DiffRemove = {
--     provider = "DiffRemove",
--     condition = checkwidth,
--     icon = " ",
--     highlight = {colors.nord11, nord_colors.line_bg}
--   }
-- }

section.right[1] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.nord7,
        i = colors.nord14,
        v = colors.nord15,
        [""] = colors.nord15,
        V = colors.nord15,
        c = colors.nord11,
        no = colors.nord15,
        s = colors.nord12,
        S = colors.nord12,
        [""] = colors.nord12,
        ic = colors.nord13w,
        R = colors.nord13,
        Rv = colors.nord13,
        cv = colors.nord15,
        ce = colors.nord11,
        r = colors.nord8,
        rm = colors.nord8,
        ["r?"] = colors.nord8,
        ["!"] = colors.nord11,
        t = colors.nord11
      }
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      return "● "
    end,
    separator = "",
    highlight = {colors.nord11, colors.nordbg, "bold"},
    separator_highlight = {colors.nordbg, colors.nordbg}
  }
}

section.right[3] = {
  LineInfo = {
    provider = "LineColumn",
    separator = " ",
    separator_highlight = {colors.nord4, colors.nordbg},
    highlight = {colors.nord4, colors.nordbg}
  }
}

section.right[4] = {
    FileFormat = {
        provider = 'FileFormat',
        condition = condition.hide_in_width,
        separator = "  ",
        separator_highlight = {'NONE', colors.nordbg},
        highlight = {colors.nord4, colors.nordbg}
    }
}

section.right[5] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = " ",
        separator_highlight = {'NONE', colors.nordbg},
        highlight = {colors.nord4, colors.nordbg}
    }
}

section.right[6] = {
    Tabstop = {
        provider = function()
            return vim.api.nvim_buf_get_option(0, "shiftwidth") .. " spaces"
        end,
        condition = condition.hide_in_width,
        separator = "  ",
        separator_highlight = {'NONE', colors.nordbg},
        highlight = {colors.nord4, colors.nordbg}
    }
}

-- section.right[2] = {
--   FileSize = {
--     provider = "FileSize",
--     separator = " ",
--     condition = buffer_not_empty,
--     separator_highlight = {colors.nord9, colors.nordbg},
--     highlight = {colors.nord4, colors.nordbg}
--   }
-- }

section.right[7] = {
    FileTypeName = {
        provider = "FileTypeName",
        separator = "  ",
        condition = buffer_not_empty,
        separator_highlight = {colors.nord9, colors.nordbg},
        highlight = {colors.nord9, colors.nordbg, "bold"}
    }
}

section.right[8] = {
  GetLspClient = {
    provider = "GetLspClient",
    separator = "  ",
    condition = buffer_not_empty,
    separator_highlight = {colors.nord9, colors.nordbg},
    highlight = {colors.nord8, colors.nordbg, "bold"}
  }
}

section.right[9] = {
  LastElement = {
    -- provider = function() return '▊ ' end,
    provider = function()
      return "   "
    end,
    highlight = {colors.nord9, colors.nordbg}
  }
}

--[[ section.short_line_left[1] = {
  BufferType = {
    provider = "FileIcon",
    separator = " ",
    separator_highlight = {colors.nordbg, colors.nordbg},
    highlight = {colors.nord9, colors.nordbg, "bold"}
  }
} ]]

-- section.short_line_left[1] = {
--     FirstElement = {
--         provider = function()
--             return ""
--         end,
--         highlight = {colors.nordbg, colors.nordbg}
--     }
-- }

section.short_line_left[2] = {
    BufferIcon = {
        provider = 'BufferIcon',
        highlight = {"#7B88A1", colors.nordbg, "none"}
    }
}

-- section.short_line_left[2] = {
--     SFileName = {provider = 'SFileName', condition = condition.buffer_not_empty, highlight = {colors.grey, colors.bg}}
-- }

--[[ section.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = {colors.nordbg, colors.nordbg}
  }
} ]]

