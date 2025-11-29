return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			float = {
				transparent = true,
			},

			terminal_colors = true,
		})

		vim.cmd("colorscheme catppuccin")
	end,
}
