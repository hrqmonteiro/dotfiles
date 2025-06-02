-- :fennel:1748870236
local _local_1_ = require("functions")
local process_files = _local_1_["process-files"]
local process_subdirectories = _local_1_["process-subdirectories"]
local function setup_lspconfig()
  local modules = require("modules")
  local lang_folders = (modules.lang or {})
  local servers = {}
  for _, lang in ipairs(lang_folders) do
    local base_path = "lua/modules/lang"
    local lang_path = (base_path .. "/" .. lang)
    local patterns = {}
    for _0, pat in ipairs(lang_folders) do
      table.insert(patterns, pat)
    end
    process_files(lang_path, patterns, servers)
    process_subdirectories(base_path, lang, lang_folders, servers)
  end
  local seen = {}
  local unique_servers = {}
  for _, server in ipairs(servers) do
    if not seen[server] then
      seen[server] = true
      table.insert(unique_servers, server)
    else
    end
  end
  local lspconfig = require("lspconfig")
  local navic = require("nvim-navic")
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local on_attach
  local function _3_(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      return navic.attach(client, bufnr)
    else
      return nil
    end
  end
  on_attach = _3_
  for _, server in ipairs(unique_servers) do
    lspconfig[server].setup({capabilities = capabilities, on_attach = on_attach})
  end
  return nil
end
local function setup_mason()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local modules = require("modules")
  local lang_folders = (modules.lang or {})
  local servers = {}
  for _, lang in ipairs(lang_folders) do
    local base_path = "lua/modules/lang"
    local lang_path = (base_path .. "/" .. lang)
    local patterns = {}
    for _0, pat in ipairs(lang_folders) do
      table.insert(patterns, pat)
    end
    process_files(lang_path, patterns, servers)
    process_subdirectories(base_path, lang, lang_folders, servers)
  end
  local seen = {}
  local unique_servers = {}
  for _, server in ipairs(servers) do
    if not seen[server] then
      seen[server] = true
      table.insert(unique_servers, server)
    else
    end
  end
  mason.setup()
  require("lspconfig").fennel_ls.setup({})
  mason_lspconfig.setup({ensure_installed = unique_servers})
  return unique_servers
end
local function _6_()
  setup_lspconfig()
  return setup_mason()
end
return {{"neovim/nvim-lspconfig", config = _6_, dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim"}}}