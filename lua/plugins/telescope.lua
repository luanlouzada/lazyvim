return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
    })
    require("telescope").load_extension("fzf")
  end,
  keys = {
    -- Encontrar arquivos no diretório atual
    {
      "<leader><space>",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Find Files (cwd)",
    },
    -- Encontrar arquivos no diretório raiz
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Find Files (Root Dir)",
    },
    -- Encontrar arquivos no diretório Obsidian
    {
      "<leader>fo",
      function()
        require("telescope.builtin").find_files({ cwd = "~/Documents/repositories/" })
      end,
      desc = "Find Files in Obsidian",
    },
    -- Realizar grep no diretório Obsidian
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep({ cwd = "~/Documents/repositories" })
      end,
      desc = "Grep in Obsidian",
    },
  },
}
