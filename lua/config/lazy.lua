local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins.copilot-chat" },
    {
      import = "lazyvim.plugins.extras.lsp.none-ls",
      config = function()
        local nls = require("null-ls")
        nls.setup({
          sources = {
            nls.builtins.diagnostics.bandit, -- Adicionando Bandit
            -- Aqui você pode adicionar outras fontes do none-ls, se necessário
          },
        })
      end,
    },
    -- Aqui você pode adicionar outras importações extras
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false, -- sempre use o último commit do git
    -- version = "*", -- tente instalar a versão estável mais recente para plugins que suportam semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- verifica automaticamente atualizações de plugins
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
