return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>g", "<cmd>Neogit<cr>", desc = "Neogit" },
	},
	config = function()
		require("neogit").setup({
			-- open the main status buffer as a floating window
			kind = "floating",
			floating = {
				relative = "editor",
				border = "rounded",
				style = "minimal",
				width = 0.8,
				height = 0.7,
			},

			-- commit editor in a floating window
			commit_editor = {
				kind = "floating",
				size = {
					width = 0.7,
					height = 0.5,
				},
			},

			-- force all other views into floaters
			commit_view = { kind = "floating" },
			log_view = { kind = "floating" },
			rebase_editor = { kind = "floating" },
			merge_editor = { kind = "floating" },
			preview_buffer = { kind = "floating" },
		})
	end,
}
