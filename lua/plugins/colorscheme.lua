return {
  {
    "embark-theme/vim",
    as = "embark", -- Renomeia o plugin para 'embark'
    config = function()
      vim.cmd("colorscheme embark") -- Configura o embark como o tema atual
    end,
  },
}
