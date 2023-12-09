return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      { "MunifTanjim/nui.nvim",        lazy = true },
      { "rcarriga/nvim-notify",        lazy = true },
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = false,
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>nl", function() require("noice").cmd("last") end,                                   silent = true, expr = true, desc = "Noice - Last Message" },
      { "<leader>nh", function() require("noice").cmd("history") end,                                silent = true, expr = true, desc = "Noice - History" },
      { "<leader>na", function() require("noice").cmd("all") end,                                    silent = true, expr = true, desc = "Noice - All" },
      { "<leader>nd", function() require("noice").cmd("dismiss") end,                                silent = true, expr = true, desc = "Noice - Dismiss all" },
      { "<c-d>",      function() if not require("noice.lsp").scroll(4) then return "<c-d>" end end,  silent = true, expr = true, desc = "Scroll forward",      mode = { "i", "n", "s" } },
      { "<c-u>",      function() if not require("noice.lsp").scroll(-4) then return "<c-u>" end end, silent = true, expr = true, desc = "Scroll backward",     mode = { "i", "n", "s" } },
    },
  }
}
