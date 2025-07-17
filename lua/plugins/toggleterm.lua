return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "horizontal",
    })

    -- Keymaps
 
    vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<cr>', { noremap = true, silent = true })

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

  end,
}
