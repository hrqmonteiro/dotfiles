require'nvim-treesitter.configs'.setup {
    -- "all", "maintained" or a list
    ensure_installed = "maintained",
    highlight = { enable = true,
    disable = { "html" },
  },
    indent = {enable = false},
    rainbow = {enable = false},
    autotag = {enable = true},
    refactor = {
        highlight_definitions = {enable = false},
        highlight_current_scope = {enable = false}
    },
    require'nvim-treesitter.configs'.setup {
    autotag = {
    enable = true,
    }
  },
}

require('nvim-ts-autotag').setup()
