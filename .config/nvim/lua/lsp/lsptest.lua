require'lspconfig'.cssls.setup{}
require'lspconfig'.solargraph.setup{
    filetypes = { "ruby", "jbuilder" }
}
require'lspconfig'.gopls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.gopls.setup{}

-- require("lsp-rooter").setup{}

local sumneko_root_path = "/home/hrq/.local/bin/lua-language-server"
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
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

-- require'lspconfig'.denols.setup{}
require'lspconfig'.tsserver.setup{}
