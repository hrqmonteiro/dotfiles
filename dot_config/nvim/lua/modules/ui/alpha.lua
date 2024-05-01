return {
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")

      local doom = {
        "=================     ===============     ===============   ========  ========",
        "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
        "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
        "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
        "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
        "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
        "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
        "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
        "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
        "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
        "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
        "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
        "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
        "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
        "||   .=='    _-'          '-__\\._-'         '-_./__-'         `' |. /|  |   ||",
        "||.=='    _-'                                                     `' |  /==.||",
        "=='    _-'                        N E O V I M                         \\/   `==",
        "\\   _-'                                                                `-_   /",
        " `''                                                                      ``' ",
      }

      local hydra = {
        "                                   ",
        "                                   ",
        "                                   ",
        "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
        "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
        "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
        "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
        "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
        "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
        "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
        " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
        " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
        "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
        "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
        "                                   ",
      }

      local button = function(sc, txt, keybind)
        local sc_ = (sc:gsub("%s", ""):gsub("SPC", "<leader>"))

        local opts = {
          position = "center",
          shortcut = sc,
          cursor = 4,
          width = 45,
          align_shortcut = "right",
          hl = "helpSpecial",
          hl_shortcut = "String",
          padding = 40
        }

        if keybind then
          opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true, nowait = true } }
        end

        local function on_press()
          local key = vim.api.nvim_replace_termcodes(keybind or (sc_ .. "<Ignore>"), true, false, true)
          vim.api.nvim_feedkeys(key, "t", false)
        end

        return {
          type = "button",
          val = txt,
          on_press = on_press,
          opts = opts
        }
      end

      local sections = {
        header = {
          type = "text",
          val = hydra,
          opts = { position = "center", hl = "Comment" }
        },
        buttons = {
          type = "group",
          val = {
            button(" SPC f r  ", "   Recently opened files", ":Telescope oldfiles<CR>"),
            button(" SPC q l  ", "   Reload last session", ":Telescope oldfiles<CR>"),
            button(" SPC o A  ", "   Open norg agenda", ":Telescope oldfiles<CR>"),
            button(" SPC p p  ", "   Open project", ":Telescope project<CR>"),
            button(" SPC RET  ", "   Jump to bookmark", ":Telescope bookmarks list<CR>"),
            button(" SPC f P  ", "   Open private configuration", ":Telescope oldfiles<CR>"),
            button(" SPC h d h", "   Open documentation", ":Telescope oldfiles<CR>"),
          },
          opts = {
            spacing = 1
          }
        },
        -- footer = {
        --   type = "text",
        --   val = text,
        --   opts = { position = "center", hl = "Comment" }
        -- },
        icon = {
          type = "button",
          val = "",
          opts = { position = "center", hl = "Decorator" },
          on_press = function()
            if vim.fn.has("mac") == 1 then
              os.execute("open https://github.com/nyoom-engineering/nyoom.nvim")
            else
              os.execute("xdg-open https://github.com/nyoom-engineering/nyoom.nvim")
            end
          end
        }
      }

      alpha.setup({
        layout = {
          { type = "padding", val = 0 },
          sections.header,
          { type = "padding", val = 1 },
          sections.buttons,
          { type = "padding", val = 1 },
          sections.footer,
          { type = "padding", val = 0 },
          sections.icon
        }
      })
    end
  }
}
