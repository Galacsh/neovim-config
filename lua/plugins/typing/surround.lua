local mappings = {
  add = "ys",          -- Add surrounding in Normal and Visual modes
  delete = "ds",       -- Delete surrounding
  find = "",           -- Find surrounding (to the right)
  find_left = "",      -- Find surrounding (to the left)
  highlight = "",      -- Highlight surrounding
  replace = "cs",      -- Replace surrounding
  update_n_lines = "", -- Update `n_lines`

  suffix_last = "",    -- Suffix to search with "prev" method
  suffix_next = "",    -- Suffix to search with "next" method
}

return {
  "echasnovski/mini.surround",
  keys = {
    { mappings.add,     nil, desc = "Add surrounding",    mode = { "n", "v" } },
    { mappings.delete,  nil, desc = "Delete surrounding" },
    { mappings.replace, nil, desc = "Replace surrounding" },
  },
  opts = {
    mappings = mappings,
  },
  config = function(_, opts)
    require("mini.surround").setup(opts)
  end,
}
