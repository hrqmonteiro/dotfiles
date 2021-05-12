local sign_define = vim.fn.sign_define
local lsp = vim.lsp

lsp.handlers["textDocument/publishDiagnostics"] =
  lsp.with(
  lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      space = 2,
      prefix = " "
    },
    signs = true,
    update_in_insert = false
  }
)

sign_define("LspDiagnosticsSignError",
            {texthl = "IndentBlanklineChar", text = "", numhl = "CursorLineNr"})
sign_define("LspDiagnosticsSignWarning",
            {texthl = "IndentBlanklineChar", text = "", numhl = "CursorLineNr"})
sign_define("LspDiagnosticsSignHint",
            {texthl = "IndentBlanklineChar", text = "", numhl = "LspDiagnosticsSignHint"})
sign_define("LspDiagnosticsSignInformation",
                   {texthl = "IndentBlanklineChar", text = "", numhl = "CursorLineNr"})
