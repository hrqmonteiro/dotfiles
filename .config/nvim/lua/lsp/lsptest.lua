require'lspconfig'.cssls.setup{}
require'lspconfig'.solargraph.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.html.setup{}

local lspconfig = require'lspconfig'
lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  }
}

require'lspconfig'.clangd.setup{}

local sumneko_root_path = "/home/hrq/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                globals = {'vim'}
            },
            workspace = {
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}

require'lspconfig'.denols.setup{}
-- require'lspconfig'.tsserver.setup{}
