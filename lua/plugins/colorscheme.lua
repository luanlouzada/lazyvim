-- colorscheme.lua
local function get_window_class()
  -- Obter o ID da janela ativa
  local window_id = vim.fn.system("xdotool getactivewindow")
  window_id = window_id:gsub("%s+", "")

  -- Obter a classe da janela usando xprop
  local window_class = vim.fn.system("xprop -id " .. window_id .. " | grep 'WM_CLASS' | awk -F '\"' '{print $4}'")
  window_class = window_class:gsub("%s+", "")

  return window_class
end

local function set_theme()
  local window_class = get_window_class()

  if window_class == "Alacritty" then
    vim.cmd("colorscheme embark")
  elseif window_class == "kitty" then
    vim.cmd("colorscheme gruvbox")
  else
    vim.cmd("colorscheme default")
  end
end

return {
  {
    "embark-theme/vim",
    as = "embark", -- Renomeia o plugin para 'embark'
    config = function()
      set_theme()
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        palette_overrides = { dark0_hard = "#0E1018", bright_red = "#C6200E" },
        overrides = {
          Comment = { fg = "#81878f", italic = true, bold = true },
          Define = { link = "GruvboxPurple" },
          Macro = { link = "GruvboxPurple" },
          ["@constant.builtin"] = { link = "GruvboxPurple" },
          ["@storageclass.lifetime"] = { link = "GruvboxAqua" },
          ["@text.note"] = { link = "TODO" },
          ["@namespace.latex"] = { link = "Include" },
          ["@namespace.rust"] = { link = "Include" },
          ContextVt = { fg = "#878788" },
          CopilotSuggestion = { fg = "#878787" },
          DiagnosticVirtualTextWarn = { fg = "#dfaf87" },
          Folded = { fg = "#fe8019", bg = "#3c3836", italic = true },
          FoldColumn = { fg = "#fe8019", bg = "#0E1018" },
          SignColumn = { bg = "#fe8019" },
          DiffAdd = { bold = true, reverse = false, fg = "", bg = "#2a4333" },
          DiffChange = { bold = true, reverse = false, fg = "", bg = "#333841" },
          DiffDelete = { bold = true, reverse = false, fg = "#442d30", bg = "#442d30" },
          DiffText = { bold = true, reverse = false, fg = "", bg = "#213352" },
          StatusLine = { bg = "#ffffff", fg = "#0E1018" },
          StatusLineNC = { bg = "#3c3836", fg = "#0E1018" },
          CursorLineNr = { fg = "#fabd2f", bg = "" },
          GruvboxOrangeSign = { fg = "#dfaf87", bg = "" },
          GruvboxAquaSign = { fg = "#8EC07C", bg = "" },
          GruvboxGreenSign = { fg = "#C6200E", bg = "" },
          GruvboxRedSign = { fg = "#F4ACA4", bg = "" },
          GruvboxBlueSign = { fg = "#83a598", bg = "" },
          WilderMenu = { fg = "#ebdbb2", bg = "" },
          WilderAccent = { fg = "#f4468f", bg = "" },
          ["@neorg.markup.inline_macro"] = { link = "GruvboxGreen" },
        },
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
