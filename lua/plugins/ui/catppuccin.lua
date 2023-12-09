return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      term_colors = true,
      -- dims the background color of inactive window
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.9,
      },
      integrations = {
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        harpoon = true,
        illuminate = {
          enabled = true,
          lsp = false
        },
        indent_blankline = {
          enabled = true,
          scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        lsp_trouble = false,
        mason = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        noice = false,
        notify = false,
        treesitter = true,
        telescope = {
          enabled = true,
        },
        which_key = false,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  }
}
