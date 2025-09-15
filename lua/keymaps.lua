local map = vim.keymap.set

-- INFO: [[ MINI FILES ]]
map('n', '<leader>e', '<cmd>lua MiniFiles.open()<CR>', { desc = 'Open Mini.files' })

-- INFO: [[ OIL.NVIM ]]
map('n', '<leader>o', '<cmd>Oil --float<CR>', { desc = 'Open parent directory' })
vim.api.nvim_create_augroup('OilKeymaps', { clear = true })

-- Toggle dotfiles visibility on Oil buffers
vim.api.nvim_create_autocmd('FileType', {
  group = 'OilKeymaps',
  pattern = 'oil',
  callback = function()
    map('n', '<leader>.', function()
      require('oil').toggle_hidden()
    end, {
      buffer = true, -- Important: makes the mapping buffer-local
      desc = 'Show/hide dotfiles',
    })
  end,
})
