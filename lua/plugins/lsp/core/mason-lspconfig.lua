return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = false,
    config = function(_, opts)
      opts.ensure_installed = require("plugins.lsp.configs")
      require("mason-lspconfig").setup(opts)
    end
  },
}
