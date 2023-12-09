local log = Logger

local toggle = function()
  vim.g.minipairs_disable = not vim.g.minipairs_disable

  if vim.g.minipairs_disable then
    log.warn("Disabled auto pairs")
  else
    log.info("Enabled auto pairs")
  end
end

return {
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("mini.pairs").setup(opts)

      vim.api.nvim_create_user_command(
        "ToggleMiniPairs",
        toggle,
        { desc = "Toggle mini.pairs" }
      )
    end,
  },
}
