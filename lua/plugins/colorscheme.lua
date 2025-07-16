return { 
  {'projekt0n/github-nvim-theme', name = 'github-theme' },
  {'Mofiqul/vscode.nvim', name = 'vscode-theme' },
  {'navarasu/onedark.nvim', name = 'onedark-theme' },
  {'catppuccin/nvim', 
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('catppuccin')
    end,
  },
  {'sainnhe/everforest', name = 'everforest' },
  {'sainnhe/gruvbox-material', name = 'gruvbox-material' },
  {'folke/tokyonight.nvim', name = 'tokyonight' },
  {'EdenEast/nightfox.nvim', name = 'nightfox' },
  {'shaunsingh/nord.nvim', name = 'nord' },
  { 'rebelot/kanagawa.nvim', name = 'kanagawa' },
}
