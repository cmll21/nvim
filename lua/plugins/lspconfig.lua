return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- Setup Mason
    require("mason").setup()

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local function on_attach(_, bufnr)
      local map = vim.keymap.set
      local opts = { buffer = bufnr, silent = true }

      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "gi", vim.lsp.buf.implementation, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "gr", vim.lsp.buf.references, opts)
      map("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "pyright",
        "ocamllsp",
      },
      automatic_installation = true,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,

        -- Override lua_ls with custom settings
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  checkThirdParty = false,
                  library = vim.api.nvim_get_runtime_file("", true),
                },
              },
            },
          })
        end,
      },
    })
  end,
}

