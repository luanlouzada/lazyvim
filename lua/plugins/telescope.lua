return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader><space>", LazyVim.telescope("files", { cwd = vim.fn.expand("%:p:h") }), desc = "Find Files (cwd)" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (Root Dir)" },
  },
}
