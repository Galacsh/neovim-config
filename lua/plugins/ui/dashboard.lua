return {
  {
    "nvimdev/dashboard-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    opts = function()
      local logo = [[⚡️]]

      -- Padding top & bottom
      logo = string.rep("\n", 6) .. logo .. string.rep("\n", 6)

      local icons = IconPack.dashboard

      local opts = {
        theme = "doom",
        hide = { statusline = false },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { icon = icons.explorer,        desc = " Explorer",        key = "e", action = "Oil", },
            { icon = icons.find_file,       desc = " Find file",       key = "f", action = "Telescope find_files", },
            { icon = icons.new_file,        desc = " New file",        key = "n", action = "ene | startinsert", },
            { icon = icons.harpoon,         desc = " Harpoon",         key = "h", action = "lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())", },
            { icon = icons.recent_files,    desc = " Recent files",    key = "r", action = "Telescope oldfiles", },
            { icon = icons.find_by_content, desc = " Find by content", key = "c", action = "Telescope live_grep", },
            { icon = icons.lazy,            desc = " Lazy",            key = "l", action = "Lazy", },
            { icon = icons.quit,            desc = " Quit",            key = "q", action = "qa", },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "→ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms ←",
            }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  }
}
