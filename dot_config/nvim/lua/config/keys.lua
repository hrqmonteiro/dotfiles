local g = vim.g
local map = vim.keymap.set
g.mapleader = " "
g.maplocalleader = " "
vim.g["conjure#mapping#doc_word"] = false
local wk = require("which-key")
local bm = require("bookmarks")

map("n", "<Leader>*", ":Telescope symbols<CR>", { desc = "Search for symbol in project" })
map("n", "<Leader>,", ":Telescope buffers<CR>", { desc = "Switch workspace buffer" })
map("n", "<Leader>.", ":Telescope find_files<CR>", { desc = "Find file" })
map("n", "<Leader><CR>", ":Telescope bookmarks list<CR>", { desc = "Jump to bookmark" })
map("n", "<Leader><Leader>", ":Telescope find_files<CR>", { desc = "Find file in project" })
map("n", "<Leader>/", ":Telescope live_grep<CR>", { desc = "Search project" })

wk.register({
  b = {
    name = "buffer",
    ["["] = { ":bprevious<CR>", "Previous buffer" },
    ["]"] = { ":bnext<CR>", "Next buffer" },
    d = { ":bdelete<CR>", "Kill buffer" },
    i = { ":JABSOpen<CR>", "JABS" },
    k = { ":bdelete<CR>", "Kill buffer" },
    l = { ":blast<CR>", "Switch to last buffer" },
    M = { bm.bookmark_ann, "Edit bookmark" },
    m = { bm.bookmark_toggle, "Set bookmark" },
    n = { ":bnext<CR>", "Next buffer" },
    p = { ":bprevious<CR>", "Previous buffer" },
  },
  c = {
    name = "code",
    a = { vim.lsp.buf.code_action, "LSP Execute code actions" },
    D = { vim.lsp.buf.references, "Jump to references" },
    d = { vim.lsp.buf.definition, "Jump to definition" },
    f = { vim.lsp.buf.format, "Format buffer/region" },
    i = { vim.lsp.buf.implementation, "Find implementations" },
    k = { vim.lsp.buf.hover, "Hover documentation" },
    r = { vim.lsp.buf.rename, "LSP Rename" },
    S = { vim.lsp.buf.document_symbol, "Symbols" },
    t = { vim.lsp.buf.type_definition, "Find type definition" },
    x = { ":TroubleToggle<CR>", "List errors (Trouble)" }
  },
  f = {
    name = "file",
    f = { ":Telescope find_files<CR>", "Find file" },
    r = { ":Telescope oldfiles<CR>", "Recent files" },
    w = { ":Telescope live_grep<CR>", "Live grep" },
  },
  g = {
    name = "git",
    ["["] = { ":Gitsigns next_hunk<CR>", "Jump to next hunk" },
    ["]"] = { ":Gitsigns prev_hunk<CR>", "Jump to previous hunk" },
    B = { ":Gitsigns blame_line<CR>", "Git blame (Gitsigns)" },
    b = { ":Telescope git_branches<CR>", "Git switch branch (Telescope)" },
    D = { ":G rm %<CR>", "Git file delete (Fugitive)" },
    F = { ":G fetch<CR>", "Git fetch (Fugitive)" },
    g = { ":LazyGit<CR>", "LazyGit status" },
    L = { ":G log<CR>", "Git log (Fugitive)" },
    R = { ":G checkout HEAD~ %<CR>", "Revert file (Fugitive)" },
    r = { ":Gitsigns reset_hunk<CR>", "Reset hunk at point" },
    S = { ":G add %<CR>", "Git stage this file (Fugitive)" },
    s = { ":Gitsigns stage_hunk<CR>", "Stage hunk at point" },
    U = { ":G reset %<CR>", "Git unstage this file (Fugitive)" }
  },
  h = {
    name = "help",
    t = { ":Telescope colorscheme<CR>", "Change colorscheme" }
  },
  i = {
    name = "insert",
    e = { ":Telescope emoji<CR>", "Emoji" }
  },
  l = {
    name = "lsp",
    f = { vim.diagnostic.open_float, "Floating diagnostics" }
  },
  o = {
    name = "open",
    ["-"] = { ":Oil<CR>", "Oil" },
    p = { ":Neotree toggle<CR>", "Project sidebar" },
    t = { ":ToggleTerm<CR>", "Toggle terminal" }
  },
  p = {
    name = "project",
    p = { ":Telescope project<CR>", "Switch project" }
  },
  t = {
    name = "toggle",
    b = { ":Gitsigns toggle_current_line_blame<CR>", "Current line blame" },
    f = { ":TZFocus<CR>", "Focus mode" },
    i = { ":IBLToggle<CR>", "Indent lines" },
    l = { ":set norelativenumber nu!<CR>", "Line numbers" },
    m = { ":TZMinimalist<CR>", "Minimalist mode" },
    r = { ":set number rnu!<CR>", "Relative line numbers" },
    z = { ":TZAtaraxis<CR>", "Zen mode" }
  }
}, { prefix = "<Leader>", silent = true })


map('t', '<esc>', [[<C-\><C-n>]])
-- map("n", "[d", vim.diagnostic.goto_prev, { silent = true, desc = "Previous diagnostic" })
-- map("n", "]d", vim.diagnostic.goto_next, { silent = true, desc = "Next diagnostic" })
-- map("n", "<Leader>q", vim.diagnostic.goto_next, { silent = true, desc = "Diagnostic loclist" })
