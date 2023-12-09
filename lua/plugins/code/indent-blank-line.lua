return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      scope = { enabled = false },
      indent = {
        char = "▎",
        tab_char = "▎",
      },
      exclude = {
        filetypes = {
          "help",
          "dashboard",
          "trouble",
          "lazy",
          "mason",
          "notify",
        },
      },
    },
    main = "ibl",
  }
}
