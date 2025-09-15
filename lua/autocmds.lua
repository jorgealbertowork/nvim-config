-- INFO: [[ Define default indentation ]]

vim.api.nvim_create_augroup('IndentSettings', { clear = true })

local indent_filetypes = {
  'css',
  'lua',
  'html',
  'javascript',
  'typescript',
  'javascriptreact',
  'typescriptreact',
}

-- Set the indent settings for each filetype
for _, ft in ipairs(indent_filetypes) do
  vim.api.nvim_create_autocmd('FileType', {
    group = 'IndentSettings',
    pattern = ft,
    callback = function()
      vim.bo.expandtab = true -- Use spaces instead of tabs
      vim.bo.shiftwidth = 2 -- Indent size
      vim.bo.tabstop = 2 -- Number of spaces a <Tab> counts for
      vim.bo.softtabstop = 2 -- Number of spaces a <Tab> uses while editing
    end,
  })
end

-- ================================================================================================
