local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local properties = {
    force_inactive = {
        filetypes = {},
        buftypes = {},
        bufnames = {}
    }
}

local components = {
    left = {
        active = {},
        inactive = {}
    },
    right = {
        active = {},
        inactive = {}
    }
}

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

properties.force_inactive.filetypes = {
    'NvimTree',
    'dbui',
    'packer',
    'startify',
    'fugitive',
    'fugitiveblame'
}

properties.force_inactive.buftypes = {
    'terminal'
}

components.left.active[1] = {
    provider = '',
    hl = {
        fg = 'skyblue'
    }
}

components.left.active[2] = {
    provider = 'vi_mode',
    hl = function()
        local val = {}

        val.name = vi_mode_utils.get_mode_highlight_name()
        val.fg = vi_mode_utils.get_mode_color()
        val.style = 'bold'

        return val
    end,
    right_sep = ' '
}

components.left.active[3] = {
    provider = 'file_info',
    hl = {
        fg = 'white',
        bg = 'oceanblue',
        style = 'bold'
    },
    left_sep = {' ', 'slant_left_2'},
    right_sep = {'slant_right_2', ' '}
}

components.left.active[4] = {
    provider = 'file_size',
    enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
    right_sep = {
        ' ',
        {
            str = 'slant_left_2_thin',
            hl = {
                fg = 'fg',
                bg = 'bg'
            }
        },
        ' '
    }
}

components.left.active[5] = {
    provider = 'position',
    right_sep = {
        ' ',
        {
            str = 'slant_right_2_thin',
            hl = {
                fg = 'fg',
                bg = 'bg'
            }
        }
    }
}

components.left.active[6] = {
    provider = 'diagnostic_errors',
    enabled = function() return lsp.diagnostics_exist('Error') end,
    hl = { fg = 'red' }
}

components.left.active[7] = {
    provider = 'diagnostic_warnings',
    enabled = function() return lsp.diagnostics_exist('Warning') end,
    hl = { fg = 'yellow' }
}

components.left.active[8] = {
    provider = 'diagnostic_hints',
    enabled = function() return lsp.diagnostics_exist('Hint') end,
    hl = { fg = 'cyan' }
}

components.left.active[9] = {
    provider = 'diagnostic_info',
    enabled = function() return lsp.diagnostics_exist('Information') end,
    hl = { fg = 'skyblue' }
}

components.right.active[1] = {
    provider = 'git_branch',
    hl = {
        fg = 'white',
        bg = 'black',
        style = 'bold'
    },
    right_sep = function()
        local val = {hl = {fg = 'NONE', bg = 'black'}}
        if vim.b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

        return val
    end
}

components.right.active[2] = {
    provider = 'git_diff_added',
    hl = {
        fg = 'green',
        bg = 'black'
    }
}

components.right.active[3] = {
    provider = 'git_diff_changed',
    hl = {
        fg = 'orange',
        bg = 'black'
    }
}

components.right.active[4] = {
    provider = 'git_diff_removed',
    hl = {
        fg = 'red',
        bg = 'black'
    },
    right_sep = function()
        local val = {hl = {fg = 'NONE', bg = 'black'}}
        if vim.b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

        return val
    end
}

components.right.active[5] = {
    provider = 'line_percentage',
    hl = {
        style = 'bold'
    },
    left_sep = '  ',
    right_sep = ' '
}

components.right.active[6] = {
    provider = 'scroll_bar',
    hl = {
        fg = 'skyblue',
        style = 'bold'
    }
}

components.left.inactive[1] = {
    provider = 'file_type',
    hl = {
        fg = 'white',
        bg = 'oceanblue',
        style = 'bold'
    },
    left_sep = {
        str = ' ',
        hl = {
            fg = 'NONE',
            bg = 'oceanblue'
        }
    },
    right_sep = {
        {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'oceanblue'
            }
        },
        'slant_right'
    }
}

local vi_mode_colors = {
    NORMAL = 'green',
    OP = 'green',
    INSERT = 'red',
    VISUAL = 'skyblue',
    BLOCK = 'skyblue',
    REPLACE = 'violet',
    ['V-REPLACE'] = 'violet',
    ENTER = 'cyan',
    MORE = 'cyan',
    SELECT = 'orange',
    COMMAND = 'green',
    SHELL = 'green',
    TERM = 'green',
    NONE = 'yellow'
}

require('feline').setup({
    default_bg = '#1F1F23',
    default_fg = 'colors.nord4',
    components = components,
    properties = properties,
    vi_mode_colors = vi_mode_colors
})
