;; fennel-ls: macro-file

(import-macros {: modules!} :macros)

(modules!
  :completion
  blink
  telescope

  :editor
  tangerine

  :lang
  ; fennel
  [go +templ]
  tailwindcss
  [typescript +eslint +vue]

  :lsp
  lspconfig

  :ui
  colorscheme
  ; dropbar
  lualine
  mini-icons
  navic)
