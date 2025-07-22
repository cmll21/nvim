
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      config = true, -- use default Mason config
    },
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local handlers = require("plugins.lsp.handlers")
    local custom_servers = require("plugins.lsp.servers")

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "lua_ls",
        "pyright",
        "ocamllsp",
      },
      automatic_installation = true,
      handlers = vim.tbl_extend("force", {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = handlers.capabilities,
            on_attach = handlers.on_attach,
          })
        end,
      }, custom_servers),
    })
  end,
}
