return {
  {
    "stevearc/dressing.nvim",
    lazy = false,
    config = function(_, opts)
      require("dressing").setup(opts)
    end,
  }
}
