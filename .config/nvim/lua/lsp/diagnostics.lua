local sign_define = vim.fn.sign_define
local lsp = vim.lsp

lsp.handlers["textDocument/publishDiagnostics"] =
  lsp.with(
  lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      space = 2,
      prefix = ""
    },
    signs = true,
    update_in_insert = false
  }
)

vim.fn.sign_define("LspDiagnosticsSignError",
                   {texthl = "LspDiagnosticsSignError", text = " ", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {texthl = "LspDiagnosticsSignWarning", text = " ", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {texthl = "LspDiagnosticsSignHint", text = " ", numhl = "LspDiagnosticsSignHint"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {texthl = "LspDiagnosticsSignInformation", text = " ", numhl = "LspDiagnosticsSignInformation"})
