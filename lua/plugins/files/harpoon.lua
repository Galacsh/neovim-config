local function switch_to(num)
  return {
    "<leader>" .. tostring(num),
    function() require("harpoon"):list():select(num) end,
    desc = "Switch to #" .. tostring(num)
  }
end

local function append()
  require("harpoon"):list():append()
end

local function quick_menu()
  local harpoon = require("harpoon")
  harpoon.ui:toggle_quick_menu(harpoon:list())
end

return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = function()
      local harpoon = require("harpoon")
      local mappings = {
        { "<leader>ha", append,     desc = "Add file" },
        { "<leader>hh", quick_menu, desc = "Open quick menu" },
      }

      for n = 1, 9 do
        table.insert(mappings, switch_to(n))
      end

      return mappings
    end,
    config = function(_, opts)
      -- harpoon2 needs ":setup" instead ".setup"
      require("harpoon"):setup(opts)
    end,
  }
}
