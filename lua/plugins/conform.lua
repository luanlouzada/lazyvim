return {
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettier" },
      markdown = { { "markdownlint", "prettier" } },
      html = { "prettier" },
      css = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      go = { "gofumpt", "goimports" },
      rust = { "ast-grep" },
    },
  }),
}
