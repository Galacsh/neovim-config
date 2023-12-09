-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- import all plugins inside lua/plugins
local plugins = {
  spec = {
    { import = "plugins.code" },
    { import = "plugins.files" },
    { import = "plugins.lsp.core" },
    { import = "plugins.typing" },
    { import = "plugins.ui" },
  },
}

-- options
local opts = {
  lazy = true,
  checker = { enabled = true },
  defaults = { version = false },
  install = {
    colorscheme = { "catppuccin", "habamax" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwplugin",
        "tarplugin",
        "tohtml",
        "tutor",
        "zipplugin",
      }
    }
  },
}

require("plugins.logger")
require("plugins.icon-pack")
require("plugins.easy")

require("lazy").setup(plugins, opts)
