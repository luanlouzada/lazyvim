return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require'cmp'

    cmp.setup({
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' }
      }),
      mapping = {
        ['<C-Space>'] = cmp.mapping.select_next_item(),
        ['<C-S-Space>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    -- Você pode adicionar mais configurações aqui, se necessário
    return capabilities
  end
}

