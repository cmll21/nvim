local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

