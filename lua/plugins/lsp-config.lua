-- ~/.config/nvim/lua/plugins/lsp.lua

return {
  -- Adicione o intelephense à configuração do lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("composer.json", ".git")(fname) or vim.loop.cwd()
          end,
          settings = {
            intelephense = {
              files = {
                maxSize = 1000000,
              },
            },
          },
        },
      },
    },
  },

  -- Configuração do mason para garantir a instalação do intelephense
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "intelephense",
      },
    },
  },
}
