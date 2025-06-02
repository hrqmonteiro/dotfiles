[{1 :echasnovski/mini.icons
    :lazy false
    :priority 1000
    :config (fn []
              (local mini-icons (require :mini.icons))

              (mini-icons.setup
                {:style :symbol
                 :file
                  {:Jenkinsfile
                    {:glyph "" :hl "MiniIconsRed"}
                   :babel.config.js
                    {:glyph "" :hl "MiniIconsYellow"}
                   :.dockerignore
                    {:glyph "󰡨" :hl "MiniIconsGrey"}
                   :docker-compose.yml
                    {:glyph "󰡨" :hl "MiniIconsPurple"}
                   :docker-compose.yaml
                    {:glyph "󰡨" :hl "MiniIconsPurple"}
                   :.eslintignore
                    {:glyph "" :hl "MiniIconsGrey"}
                   :.eslintrc.yaml
                    {:glyph "" :hl "MiniIconsPurple"}
                   :.eslintrc.yml
                    {:glyph "" :hl "MiniIconsPurple"}
                   :.eslintrc
                    {:glyph "" :hl "MiniIconsPurple"}
                   :.eslintrc.js
                    {:glyph "" :hl "MiniIconsPurple"}
                   :.eslintrc.json
                    {:glyph "" :hl "MiniIconsPurple"}
                   :.env
                    {:glyph "" :hl "MiniIconsGrey"}
                   :go.mod
                    {:glyph "" :hl "MiniIconsBlue"}
                   :go.sum
                    {:glyph "" :hl "MiniIconsBlue"}
                   :.prettierignore
                    {:glyph "" :hl "MiniIconsGrey"}
                   :.prettierrc.yaml
                    {:glyph "" :hl "MiniIconsAzure"}
                   :.prettierrc.yml
                    {:glyph "" :hl "MiniIconsAzure"}
                   :.prettierrc
                    {:glyph "" :hl "MiniIconsAzure"}
                   :.prettierrc.js
                    {:glyph "" :hl "MiniIconsAzure"}
                   :.prettierrc.json
                    {:glyph "" :hl "MiniIconsAzure"}
                   :Podfile
                    {:glyph "" :hl "MiniIconsRed"}
                   :CHANGELOG
                    {:glyph "" :hl "MiniIconsBlue"}
                   :CHANGELOG.md
                    {:glyph "" :hl "MiniIconsBlue"}
                   :README.md
                    {:glyph "" :hl "MiniIconsBlue"}
                   :README
                    {:glyph "" :hl "MiniIconsBlue"}
                   :tailwind.config.js
                    {:glyph "󱏿" :hl "MiniIconsBlue"}
                   :tailwind.config.ts
                    {:glyph "󱏿" :hl "MiniIconsBlue"}
                   :tsconfig.json
                    {:glyph "󰛦" :hl "MiniIconsBlue"}
                   :yarn.lock
                    {:glyph "" :hl "MiniIconsBlue"}
                   :.npmrc
                    {:glyph "" :hl "MiniIconsRed"}}
                    
                  :filetype
                  {:markdown {:glyph "" :hl "MiniIconsBlue"}
                   :alpha {:glyph "" :hl "MiniIconsWhite"}
                   :asm {:glyph "" :hl "MiniIconsRed"}
                   :bat {:glyph "" :hl "MiniIconsBlue"}
                   :clojure {:glyph "" :hl "MiniIconsGreen"}
                   :css {:glyph "" :hl "MiniIconsAzure"}
                   :dockerfile {:glyph "󰡨" :hl "MiniIconsBlue"}
                   :dosbatch {:glyph "" :hl "MiniIconsBlue"}
                   :dosini {:glyph "" :hl "MiniIconsWhite"}
                   :eruby {:glyph "" :hl "MiniIconsRed"}
                   :gitattributes {:glyph "" :hl "MiniIconsGrey"}
                   :gitignore {:glyph "" :hl "MiniIconsGrey"}
                   :go {:glyph "" :hl "MiniIconsAzure"}
                   :gradle {:glyph "" :hl "MiniIconsBlue"}
                   :groovy {:glyph "" :hl "MiniIconsGreen"}
                   :haml {:glyph "" :hl "MiniIconsOrange"}
                   :html {:glyph "" :hl "MiniIconsOrange"}
                   :javascript {:glyph "" :hl "MiniIconsYellow"}
                   :json {:glyph "" :hl "MiniIconsYellow"}
                   :json5 {:glyph "" :hl "MiniIconsYellow"}
                   :jsonc {:glyph "" :hl "MiniIconsYellow"}
                   :jsonl {:glyph "" :hl "MiniIconsYellow"}
                   :jsonnet {:glyph "" :hl "MiniIconsYellow"}
                   :kotlin {:glyph "" :hl "MiniIconsOrange"}
                   :make {:glyph "" :hl "MiniIconsOrange"}
                   :neogitstatus {:glyph "󰌾" :hl "MiniIconsYellow"}
                   :neogitcommitselectview {:glyph "󰌾" :hl "MiniIconsYellow"}
                   :neogitcommitview {:glyph "󰌾" :hl "MiniIconsYellow"}
                   :neogitdiffview {:glyph "󰌾" :hl "MiniIconsYellow"}
                   :neogitgitcommandhistory {:glyph "󰌾" :hl "MiniIconsYellow"}
                   :neogitlogview {:glyph "󰌾" :hl "MiniIconsYellow"}
                   :neogitpopup {:glyph "󰌾" :hl "MiniIconsYellow"}
                   :neogitrebasetodo {:glyph "󰌾" :hl "MiniIconsYellow"}
                   :neogitreflogview {:glyph "󰌾" :hl "MiniIconsYellow"}
                   :neogitrefsview {:glyph "󰌾" :hl "MiniIconsYellow"}
                   :neo-tree {:glyph "󰐅" :hl "MiniIconsGreen"}
                   :neo-tree-popup {:glyph "󰐅" :hl "MiniIconsGreen"}
                   :php {:glyph "" :hl "MiniIconsPurple"}
                   :python {:glyph "" :hl "MiniIconsBlue"}
                   :javascriptreact {:glyph "" :hl "MiniIconsBlue"}
                   :typescriptreact {:glyph "" :hl "MiniIconsBlue"}
                   :ruby {:glyph "" :hl "MiniIconsRed"}
                   :sql {:glyph "" :hl "MiniIconsPurple"}
                   :sh {:glyph "" :hl "MiniIconsGreen"}
                   :svg {:glyph "" :hl "MiniIconsPurple"}
                   :telescopeprompt {:glyph "" :hl "MiniIconsWhite"}
                   :templ {:glyph "󰅴" :hl "MiniIconsYellow"}
                   :terraform {:glyph "󱁢" :hl "MiniIconsPurple"}
                   :terraform-vars {:glyph "󱁢" :hl "MiniIconsPurple"}
                   :toggleterm {:glyph "" :hl "MiniIconsWhite"}
                   :toml {:glyph "" :hl "MiniIconsGrey"}
                   :typescript {:glyph "" :hl "MiniIconsAzure"}
                   :winbatch {:glyph "" :hl "MiniIconsBlue"}
                   :xml {:glyph "" :hl "MiniIconsOrange"}}

                     
                  :extension
                  {:test.tsx {:glyph "" :hl "MiniIconsOrange"}
                   :development
                    {:glyph "" :hl "MiniIconsGreen"}
                   :el
                    {:glyph "" :hl "MiniIconsPurple"}
                   :example
                    {:glyph "" :hl "MiniIconsGreen"}
                   :gradle
                    {:glyph "" :hl "MiniIconsBlue"}
                   :ico
                    {:glyph "" :hl "MiniIconsYellow"}
                   :jar
                    {:glyph "" :hl "MiniIconsRed"}
                   :png {:glyph "" :hl "MiniIconsPurple"}
                   :jpg {:glyph "" :hl "MiniIconsPurple"}
                   :jpeg {:glyph "" :hl "MiniIconsPurple"}
                   :lock
                    {:glyph "" :hl "MiniIconsWhite"}
                   :mako
                    {:glyph "" :hl "MiniIconsWhite"}
                   :mdx
                    {:glyph "" :hl "MiniIconsWhite"}
                   :production
                    {:glyph "" :hl "MiniIconsGreen"}
                   :staging
                    {:glyph "" :hl "MiniIconsGreen"}}})

              (_G.MiniIcons.mock_nvim_web_devicons))}]
