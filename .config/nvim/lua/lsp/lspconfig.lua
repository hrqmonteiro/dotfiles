local hiLinks = require"settings.apply".hiLinks
local highlights = require"settings.apply".highlights

local colors = {
    nord1 = "#3B4252",
    nord0 = "#2E3440",
    nord2 = "#434C5E",
    nord3 = "#4C566A",
    nord3_bright = "#616E88",
    nord4 = "#D8DEE9",
    nord5 = "#E5E9F0",
    nord6 = "#ECEFF4",
    nord7 = "#8FBCBB",
    nord8 = "#88C0D0",
    nord9 = "#81A1C1",
    nord10 = "#5E81AC",
    nord11 = "#BF616A",
    nord12 = "#D08770",
    nord13 = "#EBCB8B",
    nord14 = "#A3BE8C",
    nord15 = "#B48EAD"
}

require"lspconfig".html.setup {}
require"lspconfig".solargraph.setup {}
require"lspconfig".vimls.setup {}
require"lspconfig".cssls.setup {}
require"lspsaga".init_lsp_saga()

local sumneko_root_path = "/home/hrq/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    -- on_attach = require'lsp'.common_on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}

require'lspconfig'.efm.setup {
  init_options = {documentFormatting = true},
  filetypes = {'javascript'},
  settings = {
    rootMarkers = {".git"},
    languages = {
      javascript = {
        {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true},
      }
    }
  }
}
