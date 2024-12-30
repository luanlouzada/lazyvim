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
          laststatus = 0,
        },
        kitty = {
          enabled = true,
          font = "+4",
        },
      },
      on_open = function(win)
        vim.fn.system("kitty @ set-spacing padding=0")
      end,
      on_close = function()
        vim.fn.system("kitty @ set-spacing padding=15")
      end,
    },
    keys = {
      {
        "<leader>zz",
        "<cmd>ZenMode<cr>",
        desc = "Toggle Zen Mode",
      },
    },
  },
}
