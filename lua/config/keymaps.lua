vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Normal mode keymaps
vim.keymap.set("n", "<leader>vc", function() -- Open Neovim config in new tab
	vim.cmd("tabnew " .. vim.fn.stdpath("config"))
end, { desc = "Open Neovim config in new tab" })
map("n", "<leader>q", ":q<CR>", opts) -- Quit
map("n", "<leader>w", ":w<CR>", opts) -- Save
vim.keymap.set("n", "<leader>z", ":set wrap!<CR>", { desc = "Toggle line wrap" }) -- Toggle line wrap
vim.keymap.set("n", "H", "^", { desc = "Go to first non-blank character" })
vim.keymap.set("n", "L", "$", { desc = "Go to end of line" })

-- Visual mode keymaps
vim.keymap.set("v", "H", "^", { desc = "Go to first non-blank character" })
vim.keymap.set("v", "L", "$", { desc = "Go to end of line" })

-- Operator-pending mode keymaps
vim.keymap.set("o", "H", "^", { desc = "Go to first non-blank character" })
vim.keymap.set("o", "L", "$", { desc = "Go to end of line" })

-- Window management
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })
