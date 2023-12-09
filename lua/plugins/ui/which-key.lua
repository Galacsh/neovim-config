local hints = {
  ["<leader>e"] = { nil, "+ Explorer" },
  ["<leader>f"] = { nil, "+ Find" },
  ["<leader>g"] = { nil, "+ Git actions" },
  ["<leader>h"] = { nil, "+ Harpoon" },
  ["<leader>n"] = { nil, "+ Noice" },
  ["<leader>q"] = {
    name = "+ Close",
    ["q"] = { nil, "Close buffer" },
    ["w"] = { nil, "Close window" },
  },
  ["<leader>r"] = {
    name = "+ Refactor",
    ["r"] = { nil, "Rename" },
    ["f"] = { nil, "Format buffer" },
  },
  ["<leader>w"] = {
    name = "+ Window/Workspace",
    ["h"] = { nil, "Move to the left window" },
    ["j"] = { nil, "Move to the window below" },
    ["k"] = { nil, "Move to the window above" },
    ["l"] = { nil, "Move to the right window" },
    ["|"] = { nil, "Split vertically" },
    ["-"] = { nil, "Split horizontally" },
  },
  ["<leader>x"] = { nil, "+ Trouble" },
  ["<leader>|"] = { nil, "Split vertically" },
  ["<leader>-"] = { nil, "Split horizontally" },
}

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        spelling = { enabled = false },
      }
    },
    config = function(_, opts)
      local which_key = require("which-key")
      which_key.setup(opts)
      which_key.register(hints)
    end,
  }
}
