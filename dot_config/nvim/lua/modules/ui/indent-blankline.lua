return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        enabled = false,
        exclude = {
          buftypes = {
            "terminal", "nofile"
          },
          filetypes = {
            "help",
            "startify",
            "dashboard",
            "lazy",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "text",
          }
        },
        scope = {
          enabled = true,
          include = {
            node_type = {
              ["*"] = { "*" }
            }
          },
          show_start = false
        }
      })

      local hooks = require "ibl.hooks"

      hooks.register(
      hooks.type.SCOPE_HIGHLIGHT,
      hooks.builtin.scope_highlight_from_extmark
      )
    end
  }
}
