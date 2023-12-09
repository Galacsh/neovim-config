return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function(_, opts)
      require("mason").setup(opts)
    end
  },
}
