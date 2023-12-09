local function list_workspace_folders()
  Logger.info(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

local function format_buffer()
  vim.lsp.buf.format({ async = true })
end

local function set_keymaps(ev)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Definition" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Implementation" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "Referencese" })
  vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })
  vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature Help" })
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder,
    { buffer = ev.buf, desc = "Workspace - Add folder" })
  vim.keymap.set("n", "<leader>wd", vim.lsp.buf.remove_workspace_folder,
    { buffer = ev.buf, desc = "Workspace - Delete folder" })
  vim.keymap.set("n", "<leader>wf", list_workspace_folders, { buffer = ev.buf, desc = "Workspace - Folders" })
  vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Actions" })
  vim.keymap.set("n", "<leader>=", format_buffer, { buffer = ev.buf, desc = "Format buffer" })
  vim.keymap.set("n", "<leader>rf", format_buffer, { buffer = ev.buf, desc = "Format buffer" })
  vim.keymap.set('n', "<leader>rr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lsp = require("lspconfig")

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("CommonLspAttach", {}),
        callback = set_keymaps,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local language_servers = require("plugins.lsp.configs")
      for _, server in ipairs(language_servers) do
        local found, config = pcall(require, "plugins.lsp.configs." .. server)

        if not found then
          config = { capabilities = capabilities }
        else
          config.capabilities = capabilities
        end

        lsp[server].setup(config)
      end
    end,
  },
}
