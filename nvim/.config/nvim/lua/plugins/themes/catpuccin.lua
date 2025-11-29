return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			float = { transparent = true },
			integrations = {
				cmp = true,
				gitsigns = true,
			},
			terminal_colors = true,
		})

		vim.cmd("colorscheme catppuccin")

		vim.cmd([[
		hi CursorLine   guibg=NONE ctermbg=NONE
		]])
	end,
}
