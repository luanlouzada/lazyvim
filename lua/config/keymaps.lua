-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<S-Tab>", "<Esc>la", { noremap = true, silent = true })
-- Configuração para selecionar tudo com Ctrl+A
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Configuração para copiar para a área de transferência com Ctrl+C no modo visual
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
-- Colar do clipboard no modo normal com Ctrl+V
vim.keymap.set("n", "<C-v>", '"+p', { noremap = true, silent = true })

-- Colar do clipboard no modo de inserção com Ctrl+V
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })

-- Copiar o path do arquivo atual
vim.keymap.set("n", "<leader>cwd", ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })
