return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = "<M-w>",
            accept_line = "<M-j>",
            next = "<M-n>",
            prev = "<M-p>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          help = false,
          gitcommit = true,
        },
      })
    end,
  },
  {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
      },
      build = "make tiktoken", -- Only on MacOS or Linux
      opts = {
        model = "gpt-4o",
        question_header = '  User ',
        answer_header   = '  Copilot ',
        error_header    = '  Error ',
      },
      cmd = { 
        "CopilotChat",
        "CopilotChatToggle", 
        "CopilotChatExplain",
        "CopilotChatFix",
        "CopilotChatRefactor",
      },
      keys = {
        { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat UI" },
        { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
        { "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Fix code" },
        { "<leader>cr", "<cmd>CopilotChatRefactor<cr>", desc = "Refactor code" },
      },
    },
  },
}

