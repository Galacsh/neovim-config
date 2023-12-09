--[[
Specify lspconfig server names to install and setup with default options.
To make some tweaks, create a file "SERVER_NAME.lua" in this directory and return customized options.
--]]
return {
  "awk_ls",
  "bashls",
  "docker_compose_language_service",
  "dockerls",
  "gopls",
  "jsonls",
  "lua_ls",
  "marksman",
  "pyright",
  "rust_analyzer",
  "vimls",
  "yamlls",
}
