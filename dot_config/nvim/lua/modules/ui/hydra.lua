vim.g.mapleader = " "
vim.g.maplocalleader = " "

return {
  {
    "nvimtools/hydra.nvim",
    config = function()
      local Hydra = require("hydra")
      local gitsigns = require("gitsigns")

      local git_hint = [[
                  Git
  ^
  _J_: next hunk	  _d_: show deleted
  _K_: prev hunk	  _u_: undo last stage
  _s_: stage hunk	  _/_: show base file
  _p_: preview hunk	_S_: stage buffer
  _b_: blame line	  _B_: blame show full
  ^
      _<Enter>_: Neogit	 _q_: Exit
]]

      Hydra({
        name = "+git",
        hint = git_hint,
        mode = { "n", "x" },
        body = "<leader>gh",
        config = {
          buffer = bufnr,
          color = "red",
          invoke_on_body = true,
          hint = {
            position = "middle",
            float_opts = {
              border = "solid",
              width = 40
            }
          },
          on_key = function()
            vim.wait "50"
          end,
          on_enter = function()
            vim.cmd "mkview"
            vim.cmd "silent! %foldopen!"
            gitsigns.toggle_linehl(true)
          end,
          on_exit = function()
            local cursor_pos = vim.api.nvim_win_get_cursor(0)
            vim.cmd "loadview"
            vim.api.nvim_win_set_cursor(0, cursor_pos)
            vim.cmd "normal zv"
            gitsigns.toggle_linehl(false)
            gitsigns.toggle_deleted(false)
          end,
        },
        heads = {
          { "J",
            function()
              if vim.wo.diff then return "]c" end
              vim.schedule(function() gitsigns.next_hunk() end)
              return "<Ignore>"
            end,
            { expr = true, desc = "next hunk" } },
          { "K",
            function()
              if vim.wo.diff then return "[c" end
              vim.schedule(function() gitsigns.prev_hunk() end)
              return "<Ignore>"
            end,
            { expr = true, desc = "prev hunk" } },
          { "s",       ":Gitsigns stage_hunk<CR>",                        { silent = true, desc = "stage hunk" } },
          { "u",       gitsigns.undo_stage_hunk,                          { desc = "undo last stage" } },
          { "S",       gitsigns.stage_buffer,                             { desc = "stage buffer" } },
          { "p",       gitsigns.preview_hunk,                             { desc = "preview hunk" } },
          { "d",       gitsigns.toggle_deleted,                           { nowait = true, desc = "toggle deleted" } },
          { "b",       gitsigns.blame_line,                               { desc = "blame" } },
          { "B",       function() gitsigns.blame_line { full = true } end, { desc = "blame show full" } },
          { "/",       gitsigns.show,                                     { exit = true, desc = "show base file" } }, -- show the base of the file
          { "<Enter>", "<Cmd>Neogit<CR>",                                 { exit = true, desc = "Neogit" } },
          { "q",       nil,                                               { exit = true, nowait = true, desc = "exit" } },
        }
      })
    end
  }
}
