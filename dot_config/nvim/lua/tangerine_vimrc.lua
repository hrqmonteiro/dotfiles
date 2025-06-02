-- :fennel:1748791093
require("config.globals")
require("config.lazy")
require("config.keys")
require("config.options")
return vim.lsp.enable({"gopls"})