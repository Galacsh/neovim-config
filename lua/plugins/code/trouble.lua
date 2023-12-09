local function previous_item()
  local trouble = require("trouble")
  if trouble.is_open() then
    trouble.previous({ skip_groups = true, jump = true })
  else
    local ok, err = pcall(vim.cmd.cprev)
    if not ok then
      Logger.error(err)
    end
  end
end

local function next_item()
  local trouble = require("trouble")
  if trouble.is_open() then
    trouble.next({ skip_groups = true, jump = true })
  else
    local ok, err = pcall(vim.cmd.cnext)
    if not ok then
      Logger.error(err)
    end
  end
end

return {
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Diagnostics - Document (Trouble)" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Diagnostics - Workspace (Trouble)" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",               desc = "Diagnostics - Locations (Trouble)" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              desc = "Diagnostics - Quickfix list (Trouble)" },
      { "<leader>xp", previous_item,                                  desc = "Previous trouble/quickfix item" },
      { "<leader>xn", next_item,                                      desc = "Next trouble/quickfix item" },
    },
  }
}
