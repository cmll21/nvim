return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",  -- stable release
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "tami5/sqlite.lua",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fh", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    { "<leader>fr", "<cmd>Telescope frecency<cr>", desc = "Frecency" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Bookmarks" },
  },
}

