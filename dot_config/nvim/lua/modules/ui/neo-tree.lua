return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        default_component_configs = {
          git_status = {
            symbols = {
              -- Change type
              added     = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "~", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "-", -- this can only be used in the git_status source
              renamed   = "~", -- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "",
              conflict  = "",
            }
          },
          indent = {
            with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            with_markers = false,
            expander_highlight = "NeoTreeFileIcon"
          },
          name = {
            use_git_status_colors = false
          },
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false
          }
        },
        window = {
          mappings = {
            ["<cr>"] = "open_tabnew",
          },
          position = "left",
          width = 30
        }
      })
    end
  }
}
