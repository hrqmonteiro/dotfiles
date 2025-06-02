(local lazypath (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim))
(local modules (require :modules))
(local {: create-spec-from-map} (require :functions))

(when (not (vim.loop.fs_stat lazypath))
  (vim.fn.system [:git
                  :clone
                  "--filter=blob:none"
                  :--single-branch
                  "https://github.com/folke/lazy.nvim.git"
                  lazypath]))

(vim.opt.runtimepath:prepend lazypath)

(local lazy (require :lazy))

(lazy.setup {:spec (create-spec-from-map modules)})
