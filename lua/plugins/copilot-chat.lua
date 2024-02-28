local IS_DEV = false

local prompts = {
  -- Code related prompts
  Explain = "Explique como funciona o seguinte código.",
  Review = "Revise o seguinte código e sugira melhorias.",
  Tests = "Explique o funcionamento do código selecionado e, em seguida, crie testes unitários para ele.",
  Refactor = "Refatore o seguinte código para melhorar sua clareza e legibilidade.",
  -- Text related prompts
  Summarize = "Resuma o texto a seguir.",
  Spelling = "Corrija quaisquer erros de gramática e ortografia no texto a seguir.",
  Wording = "Melhore a gramática e a redação do texto a seguir.",
  Concise = "Reescreva o texto a seguir para torná-lo mais conciso.",
}
return {
  -- Import the copilot plugin
  { import = "lazyvim.plugins.extras.coding.copilot" },
  {
    dir = IS_DEV and "~/Projects/research/CopilotChat.nvim" or nil,
    "jellydn/CopilotChat.nvim",
    -- Will be merged to main branch soon
    branch = "canary",
    opts = {
      mode = "split",
      show_help = "yes",
      prompts = prompts,
    },
    build = function()
      vim.defer_fn(function()
        vim.cmd("UpdateRemotePlugins")
        vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
      end, 3000)
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>ccR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
      { "<leader>ccs", "<cmd>CopilotChatSummarize<cr>", desc = "CopilotChat - Summarize text" },
      { "<leader>ccS", "<cmd>CopilotChatSpelling<cr>", desc = "CopilotChat - Correct spelling" },
      { "<leader>ccw", "<cmd>CopilotChatWording<cr>", desc = "CopilotChat - Improve wording" },
      { "<leader>ccc", "<cmd>CopilotChatConcise<cr>", desc = "CopilotChat - Make text concise" },
      { "<leader>ccb", "<cmd>lua AskCopilotChat()<CR>", desc = "CopilotChat - Ask with custom input" },
      -- Those commands only available on canary branch
      {
        "<leader>ccv",
        ":CopilotChatVsplitVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
    },
  },
}
