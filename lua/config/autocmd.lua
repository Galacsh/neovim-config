local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local auto_commands = augroup('AutoCommands', {})

-- highlight on yank
autocmd('TextYankPost', {
  group = auto_commands,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 50 })
  end,
})
