local g = vim.g

g.indent_blankline_buftype_exclude = {'terminal', 'nofile'}
g.indent_blankline_filetype_exclude = {'help', 'startify', 'dashboard', 'packer', 'NeogitStatus', 'gitcommit' }
g.indentLine_char = '▏'
g.indent_blankline_use_treesitter=true
g.indent_blankline_char_highlight = 'IndentLine'
g.indent_blankline_context_patterns = { 'class', 'return', 'function', 'method', '^if', '^while', 'jsx_element', '^for', '^object', '^table', 'block',
    'arguments', 'if_statement', 'else_clause', 'jsx_element', 'jsx_self_closing_element', 'try_statement',
    'catch_clause', 'import_statement', 'operation_type' }

vim.api.nvim_exec (
[[

let g:indent_blankline_show_current_context = v:true

]], "")
