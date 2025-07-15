return {
  -- Notification system
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  },
  -- UI Enhancer
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          progress = { enabled = true },
          signature = { enabled = true },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
        },
      })
    end,
  },
}

