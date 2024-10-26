return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 120,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          laststatus = 0, -- Desativa a barra de status no Zen Mode
        },
        kitty = {
          enabled = true,
          font = "+4", -- Aumenta a fonte no Kitty em 4 pontos
        },
      },
      on_open = function(win)
        vim.fn.system("kitty @ set-spacing padding=0")
      end,
      on_close = function()
        vim.fn.system("kitty @ set-spacing padding=15")
      end,
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>z"] = { "<cmd>ZenMode<cr>", "Toggle Zen Mode" },
      },
    },
  },
}
