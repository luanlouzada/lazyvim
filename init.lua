-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
package.path = package.path
  .. ";"
  .. vim.fn.expand("~/.luarocks/share/lua/5.1/?.lua")
  .. ";"
  .. vim.fn.expand("~/.luarocks/share/lua/5.1/?/init.lua")
package.cpath = package.cpath .. ";" .. vim.fn.expand("~/.luarocks/lib/lua/5.1/?.so")
