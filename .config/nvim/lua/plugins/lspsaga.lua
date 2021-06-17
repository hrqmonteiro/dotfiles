local saga = require 'lspsaga'

saga.init_lsp_saga {
    code_action_icon = "💡",
    code_action_prompt = {
        enable = true,
        sign = false,
        virtual_text = true,
    }
}

-- code action
vim.cmd "nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>"
vim.cmd "vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>"
-- or use command
-- nnoremap <silent><leader>ca :Lspsaga code_action<CR>
-- vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
