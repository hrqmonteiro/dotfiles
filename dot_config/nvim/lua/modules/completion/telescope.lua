return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "xiyaowong/telescope-emoji.nvim",
      "tomasky/bookmarks.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
      "dharmx/telescope-media.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          dynamic_preview_title = true,
          entry_prefix = "  ",
          file_ignore_patterns = { ".git/", "^node_modules/", ".clj-kondo/" },
          layout_config = {
            height = 0.8,
            horizontal = {
              preview_cutoff = 120,
              preview_width = 0.55,
              prompt_position = "top",
              vertical = {
                mirror = false
              },
              width = 0.87
            },
          },
          layout_strategy = "flex",
          prompt_prefix = "   ",
          selection_caret = "  ",
          sorting_strategy = "ascending",
        },
        extensions = {
          emoji = {
            action = function(emoji)
              vim.api.nvim_put({ emoji.value }, 'c', false, true)
            end
          },
        },
        pickers = {
          oldfiles = {
            prompt_title = "Recent Files"
          }
        }
      })

      require("telescope").load_extension("emoji")
      require("telescope").load_extension("bookmarks")
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("project")
      require("telescope").load_extension("media")

      require("bookmarks").setup({
        save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
        keywords = {
          ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
          ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
          ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
          ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
        },
        on_attach = function(bufnr)
          local bm = require "bookmarks"
          local map = vim.keymap.set
          map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
          map("n", "mi", bm.bookmark_ann)    -- add or edit mark annotation at current line
          map("n", "mc", bm.bookmark_clean)  -- clean all marks in local buffer
          map("n", "mn", bm.bookmark_next)   -- jump to next mark in local buffer
          map("n", "mp", bm.bookmark_prev)   -- jump to previous mark in local buffer
          map("n", "ml", bm.bookmark_list)   -- show marked file list in quickfix window
        end
      })
    end
  }
}
