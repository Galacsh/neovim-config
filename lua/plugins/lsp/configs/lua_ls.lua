return {
  on_init = function(client)
    client.config.settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = {
          checkThirdParty = true,
          library = { vim.env.VIMRUNTIME },
        },
      }
    }
  end,
}
