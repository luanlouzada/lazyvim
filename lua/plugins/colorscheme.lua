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
    as = "gruvbox", -- Renomeia o plugin para 'gruvbox'
    config = function()
      set_theme()
    end,
  },
}
