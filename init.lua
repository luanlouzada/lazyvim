-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
package.path = package.path
  .. ";"
  .. vim.fn.expand("~/.luarocks/share/lua/5.1/?.lua")
  .. ";"
  .. vim.fn.expand("~/.luarocks/share/lua/5.1/?/init.lua")
package.cpath = package.cpath .. ";" .. vim.fn.expand("~/.luarocks/lib/lua/5.1/?.so")
-- Configuração para usar o Python do ambiente virtual no Neovim
vim.g.python3_host_prog = vim.fn.expand("~/.venvs/neovim-env/bin/python")
