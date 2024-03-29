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
    mappings = {
      show_diff = {
        normal = "gZd",
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
          local currentBuffer = vim.api.nvim_get_current_buf() -- Pega o identificador do buffer atual
          local bufferContent = table.concat(vim.api.nvim_buf_get_lines(currentBuffer, 0, -1, false), "\n") -- Concatena as linhas do buffer

          -- Combina o conteúdo do clipboard com o conteúdo do buffer
          local combinedContent = "Clipboard: " .. clipboardContent .. "\nBuffer:\n" .. bufferContent

          if clipboardContent ~= "" or bufferContent ~= "" then
            require("CopilotChat").ask(
              "Fix diagnostic: " .. combinedContent,
              { selection = require("CopilotChat.select").none }
            )
          else
            print("Clipboard e buffer estão vazios!")
          end
        end,
        desc = "CopilotChat - Fix diagnostic com conteúdo copiado e do buffer",
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
