local function is_hidden_file(name, _)
  return vim.startswith(name, ".")
end

local function is_always_hidden(name, _)
  return name == ".DS_Store" or name == "." or name == ".."
end

local keymaps_in_oil_buffer = {
  ["g?"] = "actions.show_help",
  ["<cr>"] = "actions.select",
  ["<c-space>"] = "actions.preview",
  ["-"] = "actions.parent",
  ["_"] = "actions.open_cwd",
  ["gs"] = "actions.change_sort",
  ["g."] = "actions.toggle_hidden",
  ["<esc>"] = "actions.close",
  ["q"] = "actions.close",
}

return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>Oil --float<cr>", desc = "Explorer" }
    },
    opts = {
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = false,
      keymaps = keymaps_in_oil_buffer,
      use_default_keymaps = false,
      view_options = {
        show_hidden = true,
        is_hidden_file = is_hidden_file,
        is_always_hidden = is_always_hidden,
        sort = {
          { "type", "asc" },
          { "name", "asc" },
        },
      },
    },
    config = function(_, opts)
      require("oil").setup(opts)
    end,
  }
}
