local function comment()
  return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
end

return {
  {
    "echasnovski/mini.comment",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    events = { "BufReadPre", "BufNewFile" },
    opts = {
      options = { custom_commentstring = comment },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
}
