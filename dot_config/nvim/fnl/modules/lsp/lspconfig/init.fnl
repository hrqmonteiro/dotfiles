(local {: process-files : process-subdirectories } (require :functions))

(fn setup-lspconfig []
  (let [modules (require :modules)
        lang-folders (or modules.lang {})
        servers {}]
    (each [_ lang (ipairs lang-folders)]
      (local base-path :lua/modules/lang)
      (local lang-path (.. base-path "/" lang))
      (local patterns {})
      (each [_ pat (ipairs lang-folders)] (table.insert patterns pat))
      (process-files lang-path patterns servers)
      (process-subdirectories base-path lang lang-folders servers))
    (local seen {})
    (local unique-servers {})
    (each [_ server (ipairs servers)]
      (when (not (. seen server)) (tset seen server true)
        (table.insert unique-servers server)))
    (local lspconfig (require :lspconfig))
    (local navic (require :nvim-navic)) ;; Adjust if your module name differs
    (local capabilities (vim.lsp.protocol.make_client_capabilities))
    (local on-attach
      (fn [client bufnr]
        ;; ... additional on_attach logic can go here ...
        (when client.server_capabilities.documentSymbolProvider
          (navic.attach client bufnr))
        ;; ... other on_attach logic continues here ...
        ))
    (each [_ server (ipairs unique-servers)]
      ((. (. lspconfig server) :setup)
        {:capabilities capabilities
         :on_attach on-attach}))))

(fn setup-mason []
  (let [mason (require :mason)
        mason-lspconfig (require :mason-lspconfig)
        modules (require :modules)
        lang-folders (or modules.lang {})
        servers {}]
    (each [_ lang (ipairs lang-folders)]
      (local base-path :lua/modules/lang)
      (local lang-path (.. base-path "/" lang))
      (local patterns {})
      (each [_ pat (ipairs lang-folders)] (table.insert patterns pat))
      (process-files lang-path patterns servers)
      (process-subdirectories base-path lang lang-folders servers))
    (local seen {})
    (local unique-servers {})
    (each [_ server (ipairs servers)]
      (when (not (. seen server)) (tset seen server true)
        (table.insert unique-servers server)))
    (mason.setup)
    
    ((. (require :lspconfig) :fennel_ls :setup) {})

    (mason-lspconfig.setup {:ensure_installed unique-servers})
    unique-servers))

[{1 :neovim/nvim-lspconfig
    :config (fn []
              (setup-lspconfig)
              (setup-mason)
              )
    :dependencies ["williamboman/mason.nvim" "williamboman/mason-lspconfig.nvim"]}]
