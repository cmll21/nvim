return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets", -- ✅ this line is key
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}

