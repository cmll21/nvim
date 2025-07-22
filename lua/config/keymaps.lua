vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Normal mode keymaps
vim.keymap.set("n", "<leader>vc", function() -- Open Neovim config in new tab
  vim.cmd("tabnew " .. vim.fn.stdpath("config"))
end, { desc = "Open Neovim config in new tab" })
map("n", "<leader>q", ":q<CR>", opts) -- Quit
map("n", "<leader>w", ":w<CR>", opts) -- Save
