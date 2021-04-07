local protocol = require "vim.lsp.protocol"
local map = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
vim.o.completeopt = "menuone,noselect"

require"compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    allow_prefix_unmatch = false,
    documentation = true,
    source = {
        path = {kind = "", menu = ""},
        buffer = {kind = "", menu = ""},
        vsnip = {kind = "﬏", menu = ""},
        nvim_lsp = {menu = ""},
        nvim_lua = {kind = "", menu = ""},
        treesitter = {kind = "滑", menu = ""},
        spell = true,
        calc = true,
        tags = true,
        snippets_nvim = true,
        -- omni = true
        tabnine = {kind = "", menu = ""}
    }
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

_G.MUtils = {}
vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            vim.fn["compe#confirm"]()
            return npairs.esc("<c-y>")
        else
            vim.defer_fn(function()
                vim.fn["compe#confirm"]("<cr>")
            end, 20)
            return npairs.esc("<c-n>")
        end
    else
        return npairs.check_break_line_char()
    end
end

-- map('i', '<CR>', 'v:lua.MUtils.completion_confirm()', {expr = true, noremap = true})
map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- protocol.CompletionItemKind = {
--     " ", " ", " ", " ", "ﴲ ", " ", "פּ ", " ", " ", "襁 ", " ", " ",
--     " ", " ", "﬒ ", " ", " ", " ", " ", " ", "ﲀ ", "ﳤ ", " ", " ",
--     " "
-- }
