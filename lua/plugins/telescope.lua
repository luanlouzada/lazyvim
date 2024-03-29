return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader><space>", LazyVim.telescope("files", { cwd = vim.fn.expand("%:p:h") }), desc = "Find Files (cwd)" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (Root Dir)" },
    {
      "<leader>fo",
      function()
        require("telescope.builtin").find_files({ cwd = "~/Documents/repositories/" })
      end,
      desc = "Find Files in Obsidian",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep({ cwd = "~/Documents/repositories" })
      end,
      desc = "Grep in Obsidian",
    },
  },
}
