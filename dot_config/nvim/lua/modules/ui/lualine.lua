return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "ecthelionvi/NeoComposer.nvim",
      "kkharji/sqlite.lua"
    },
    lazy = false,
    config = function()
      local navic = require("nvim-navic")
      require("NeoComposer").setup({
      })

      vim.cmd("hi! link ComposerNormal StatusLine")

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { require("NeoComposer.ui").status_recording, 'branch', 'diff', 'diagnostics' },
          lualine_d = { 'filename' },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {}
      }
    end
  }
}
