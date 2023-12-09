local function get_selection_window()
  local wins = vim.api.nvim_list_wins()
  table.insert(wins, 1, vim.api.nvim_get_current_win())
  for _, win in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "" then
      return win
    end
  end
  return 0
end

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = function()
      local telescope = require("telescope.builtin")
      local runtime = Easy.runtime
      return {
        { "<leader><space>", runtime(telescope.git_files),                                                                desc = "Git files" },
        { "<leader>ff",      runtime(telescope.find_files),                                                               desc = "Files" },
        { "<leader>fa",      runtime(telescope.find_files, { hidden = true, no_ignore = true, no_ignore_parent = true }), desc = "All files" },
        { "<leader>fb",      runtime(telescope.buffers, { sort_mru = true, sort_lastused = true }),                       desc = "Buffers" },
        { "<leader>fc",      runtime(telescope.live_grep, { show_line = true }),                                          desc = "Content" },
        { "<leader>fh",      runtime(telescope.help_tags),                                                                desc = "Help" },
        { "<leader>f'",      runtime(telescope.marks),                                                                    desc = "Marks" },
        { "<leader>fm",      runtime(telescope.man_pages),                                                                desc = "Man pages" },
        { "<leader>fr",      runtime(telescope.oldfiles),                                                                 desc = "Recent files" },
        { "<leader>ft",      runtime(telescope.current_buffer_fuzzy_find),                                                desc = "Buffer" },
      }
    end,
    opts = function()
      local actions = require("telescope.actions")

      return {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          -- open files in the first window that is an actual file.
          -- use the current window if no other window is available.
          get_selection_window = get_selection_window,
          mappings = {
            i = {
              ["<c-down>"] = actions.cycle_history_next,
              ["<c-n>"] = actions.cycle_history_next,
              ["<c-up>"] = actions.cycle_history_prev,
              ["<c-p>"] = actions.cycle_history_prev,
              ["<c-d>"] = actions.preview_scrolling_down,
              ["<c-u>"] = actions.preview_scrolling_up,
            },
            n = {
              ["q"] = actions.close,
            },
          },
        },
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
    end,
  }
}
