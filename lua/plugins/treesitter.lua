return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "python", "javascript", "typescript", "ocaml", "c", "cpp", "java"
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      auto_install = true,
    })
  end,
}

