(local options {:always_divide_middle true
       :component_separators {:left "" :right ""}
       :disabled_filetypes {:statusline {} :winbar {}}
       :extensions ["lazy" "mason" "neo-tree"]
       :globalstatus true
       :icons_enabled true
       :ignore_focus {}
       :refresh {:statusline 100 :tabline 100 :winbar 100}
       :section_separators {:left "" :right ""}
       :theme :auto})

(fn border [padding]
  {1 (fn [] " ") :color {:fg ""} : padding :separator ""})

(fn hide-in-width []
  (let [window-width-limit 100] (< vim.o.columns window-width-limit)))

(local hidden-filetypes [:aerial
                          :dapui_breakpoints
                          :dapui_console
                          :dapui_hover
                          :dapui_scopes
                          :dapui_stacks
                          :dapui_watches
                          :edgy
                          :harpoon
                          :neo-tree
                          :neo-tree-popup
                          :NeogitCommitSelectView
                          :NeogitCommitView
                          :NeogitConsole
                          :NeogitDiffView
                          :NeogitGitCommandHistory
                          :NeogitLogView
                          :NeogitPopup
                          :NeogitRebaseTodo
                          :Neogitreflogview
                          :Neogitrefsview
                          :NeogitStatus
                          :neotest-output-panel
                          :neotest-summary
                          :nvimtree
                          :overseerform
                          :overseerlist])

(fn file-name-component []
  (let [home (vim.fn.expand "~")
             full-path (vim.fn.expand "%:p")
             modified-highlight :lualine_c_diff_removed_normal
             file-icon "󰆓"
             current-filetype vim.bo.filetype
             modified vim.bo.modified]
    (var display-path nil)
    (if (= (vim.fn.empty full-path) 1) (set display-path (vim.fn.getcwd))
        (set display-path full-path))
    (when (= (display-path:sub 1 (length home)) home)
      (set display-path (.. "~" (display-path:sub (+ (length home) 1))))
      (when (= display-path "~") (set display-path "~/")))
    (when (vim.tbl_contains hidden-filetypes current-filetype)
      (local ___antifnl-rtn-1-__
             (or (and modified (.. "%#" modified-highlight "#" file-icon " "
                                   display-path)) display-path))
      (let [___antifnl_rtn_1___ ___antifnl-rtn-1-__]
        (lua "return ___antifnl_rtn_1___")))
    (when (hide-in-width)
      (local file-name (vim.fn.expand "%:t"))
      (local ___antifnl-rtn-1-__
             (or (and modified (.. "%#" modified-highlight "#" file-icon " "
                                   file-name)) file-name))
      (let [___antifnl_rtn_1___ ___antifnl-rtn-1-__]
        (lua "return ___antifnl_rtn_1___")))
    (or (and modified (.. "%#" modified-highlight "#" file-icon " "
                          display-path)) display-path)))

(fn mode-component []
  (let [mode (vim.fn.mode)
             mode-map {"\022" "V-BLK"
             :R "REP"
             :V "V-LINE"
             :c "CMD"
             :i "INS"
             :n "NOR"
             :s "SEA"
             :t "TER"
             :v "VIS"}]
    (or (. mode-map mode) mode)))

(local lsp-icons {:bashls ""
       :clangd "󰙅"
       :csharp_ls "󰌛"
       :cssls ""
       :dartls ""
       :denols "󰛦"
       :dockerls "󰡨"
       :elixirls "󱈙"
       :eslint "󰱺"
       :fennel_ls ""
       :gopls "󰟓"
       :hls "󰟵"
       :html "󰌝"
       :jdtls ""
       :kotlin_language_server "󰌹"
       :lua_ls "󰢱"
       :marksman ""
       :metals ""
       :phpactor "󰌵"
       :powershell_es ""
       :pylsp "󰌠"
       :pyright "󰌠"
       :rust_analyzer ""
       :scssls ""
       :sqlls "󰾷"
       :stylua "󰢱"
       :sumneko_lua "󰢱"
       :tailwindcss ""
       :templ "󰅴"
       :terraformls "󰓧"
       :ts_ls "󰛦"
       :volar "󰡻"
       :yamlls "󰛙"})

(fn lsp-server-component []
  (when (hide-in-width) (lua "return \"\""))
  (local clients (vim.lsp.get_clients {:bufnr 0}))
  (local parts {})
  (each [_ client (ipairs clients)]
    (local icon (. lsp-icons client.name))
    (if icon (table.insert parts (.. icon "  "))
        (table.insert parts (.. client.name " "))))
  (if (= (length parts) 0) " " (table.concat parts)))

(fn git-branch-component []
  (let [handle (io.popen "git rev-parse --abbrev-ref HEAD 2>/dev/null")
               branch-name (: (handle:read :*a) :gsub "%s+" "")]
    (handle:close)
    (when (= branch-name "") (lua "return \"\""))
    (local branch-icon "")
    (local branch-highlight :lualine_b_normal)
    (.. branch-icon " " branch-name)))

(fn has-file-opened []
  (and (not= vim.bo.filetype "") (not= (vim.fn.expand "%:p") "")))

(local sections {:lualine_a [mode-component]
       :lualine_b {}
       :lualine_c [
                   ; (border {:right 1})
                   ; {1 :filetype
                   ; :icon {:align :right}
                   ; :padding 0
                   ; :icon_only true}
                   ; {1
                   ; file-name-component
                   ; :padding 0}

                   {1 :filename}

                   {1 :navic}]

                   ; (border {:right 1})
                   ; {1
                   ; :location
                   ; :cond has-file-opened
                   ; :padding 0}

                   ; (border {:right 1})
                   ; {1
                   ; :progress
                   ; :cond has-file-opened
                   ; :padding 0}

                   ; (border {:right 1})
                   ; {1 :diff}]
       :lualine_x [{1 :diagnostics :always_visible false :sections ["error" "hint" "warn" "info"]} lsp-server-component  git-branch-component]
       :lualine_y {}
       :lualine_z {}})

[{1 "nvim-lualine/lualine.nvim"
    :opts
    {:options options
    :sections sections}}]
