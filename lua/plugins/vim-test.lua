return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>TestNearest<CR>", { silent = true }),
  vim.api.nvim_set_keymap("n", "<leader>TT", "<cmd>TestFile<CR>", { silent = true }),
  vim.api.nvim_set_keymap("n", "<leader>aa", "<cmd>TestSuite<CR>", { silent = true }),
  vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>TestLast<CR>", { silent = true }),
  vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>TestVisit<CR>", { silent = true }),
  vim.cmd("let test#strategy = 'vimux'"),
}
