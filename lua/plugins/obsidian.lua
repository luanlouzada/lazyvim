return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/SecondBrain",
      },
    },
    templates = {
      subdir = "05 Templates",
      date_format = "%d/%m/%Y",
      time_format = "%H:%M",
    },
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>op"] = {
        action = "<cmd>ObsidianTemplate Programming<CR>",
        opts = { noremap = true, buffer = true },
      },
      ["<leader>oe"] = {
        action = "<cmd>ObsidianTemplate Economics<CR>",
        opts = { noremap = true, buffer = true },
      },
      ["<leader>oi"] = {
        action = "<cmd>ObsidianTemplate Ideologies<CR>",
        opts = { noremap = true, buffer = true },
      },
      ["<leader>od"] = {
        action = "<cmd>ObsidianTemplate Default<CR>",
        opts = { noremap = true, buffer = true },
      },
      ["<leader>og"] = {
        action = "<cmd>ObsidianTemplate General<CR>",
        opts = { noremap = true, buffer = true },
      },
      ["<leader>ob"] = {
        action = "<cmd>ObsidianTemplate Book<CR>",
        opts = { noremap = true, buffer = true },
      },
    },
  },
}
