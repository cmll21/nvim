return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function lsp_status()
      local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
      if #buf_clients == 0 then return "  No LSP" end
      local names = {}
      for _, client in pairs(buf_clients) do
        table.insert(names, client.name)
      end
      return "  " .. table.concat(names, ", ")
    end

    local function copilot_status()
      local ok, api = pcall(require, "copilot.api")
      if not ok then return "" end
      local status = api.status.data
      if status == nil or status.message == "" then return "" end
      return " " .. status.message
    end

    require("lualine").setup({
      options = {
        theme = "auto",
        icons_enabled = true,
        section_separators = "", -- cleaner UI
        component_separators = "",
        globalstatus = true,
        disabled_filetypes = { statusline = { "NvimTree", "lazy" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {
          copilot_status,
          lsp_status,
          "encoding",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}

