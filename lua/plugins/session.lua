return {
  "rmagatti/session-lens",
  dependencies = {
    "rmagatti/auto-session", -- manages saving/loading
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_save_enabled = true,
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
    })

    require("session-lens").setup({
      path_display = { "shorten" },
    })

    require("telescope").load_extension("session-lens")
  end,
  keys = {
    { "<leader>sl", "<cmd>SessionRestore<CR>", desc = "Restore Last Session" },
    { "<leader>ss", "<cmd>SearchSession<CR>", desc = "Search Sessions" },
  },
}
