return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = true, -- Habilita o debug
      show_help = false,
      temperature = 0.2,
      system_prompt = "me responda sempre em português",
      model = "gpt-4",
      show_folds = true,
      window = {
        layout = "float",
        relative = "editor",
        width = 1,
        height = 0.4,
        row = 30,
      },
    },
    keys = {
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      {
        "<leader>ccd",
        function()
          local clipboardContent = vim.fn.getreg("+") -- Pega o conteúdo do clipboard
          if clipboardContent ~= "" then
            require("CopilotChat").ask(
              "Fix diagnostic: " .. clipboardContent,
              { selection = require("CopilotChat.select").none }
            )
          else
            print("Clipboard está vazio!")
          end
        end,
        desc = "CopilotChat - Fix diagnostic com conteúdo copiado",
      },
      {
        "<leader>cce",
        function()
          require("CopilotChat").ask(
            "There is a problem in this code. Rewrite the code to show it with the bug fixed.",
            { selection = require("CopilotChat.select").buffer }
          )
        end,
        desc = "CopilotChat - Fix error",
      },
      {
        "<leader>ccc",
        function()
          require("CopilotChat").ask("Explain", { selection = require("CopilotChat.select").buffer })
        end,
        desc = "CopilotChat - Explain",
      },
    },
  },
}
