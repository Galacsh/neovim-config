local function no_animation()
  return 0
end

return {
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "▎",
      options = { try_as_border = true },
      draw = { animation = no_animation },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "dashboard",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  }
}
