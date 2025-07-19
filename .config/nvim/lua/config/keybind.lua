-- Leader Key

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Base Remaps

vim.keymap.set("n", "jk", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("v", "jk", "<Esc>")
vim.keymap.set("c", "jk", "<Esc>")

vim.keymap.set("n", "<C-v>", "P")
vim.keymap.set("i", "<C-v>", "<C-r>")

vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { desc = "Prev Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next Buffer", noremap = true, silent = true })

vim.keymap.set("n", "<Leader>bd", ":bd<CR>", { desc = "Delete Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bD", ":bd!<CR>", { desc = "Delete Buffer for Sure", noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bw", ":bw<CR>", { desc = "Wipeout Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bW", ":bw!<CR>", { desc = "Wipeout Buffer for Sure", noremap = true, silent = true })

vim.keymap.set("n", "<Leader>i", "a", { noremap = true, silent = true, desc = "Insert After" })
vim.keymap.set("n", "a", "<Nop>", { noremap = true, silent = true })
