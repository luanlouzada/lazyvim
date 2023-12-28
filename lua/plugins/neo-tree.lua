return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neotree_toggle = function()
      local is_neotree_open = false
      for _, buf in pairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].filetype == "neo-tree" then
          is_neotree_open = true
          break
        end
      end
      if is_neotree_open then
        vim.cmd(":Neotree close")
      else
        vim.cmd(":Neotree filesystem reveal left")
      end
    end

    vim.keymap.set("n", "<C-n>", neotree_toggle, {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
  end,
}

