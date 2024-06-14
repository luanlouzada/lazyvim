-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
--vim.g.python3_host_prog = "~/myvenv/bin/python"
vim.g.python3_host_prog = "/home/louzada/.pyenv/versions/3.9.12/envs/vmanager/bin/python"
package.path = package.path
  .. ";"
  .. vim.fn.expand("~/.luarocks/share/lua/5.1/?.lua")
  .. ";"
  .. vim.fn.expand("~/.luarocks/share/lua/5.1/?/init.lua")
package.cpath = package.cpath .. ";" .. vim.fn.expand("~/.luarocks/lib/lua/5.1/?.so")
