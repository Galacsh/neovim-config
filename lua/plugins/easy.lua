local M = {}

function M.runtime(fn, ...)
  return function()
    fn(unpack(arg))
  end
end

function M.get_foreground(name)
  local hl = vim.api.nvim_get_hl
      and vim.api.nvim_get_hl(0, { name = name })
      or vim.api.nvim_get_hl_by_name(name, true)
  local fg = hl and (hl.fg or hl.foreground)
  return fg and { fg = string.format("#%06x", fg) } or nil
end

Easy = M
