return {
	"AlexvZyl/nordic.nvim",
	name = "nordic",
	config = function()
		require("nordic").setup({
			bright_border = true,
			transparent = {
				bg = true,
				float = true,
			},
			telescope = {
				style = "flat",
			},
		})

		vim.cmd("colorscheme nordic")
		vim.cmd([[
		hi CursorLine   guibg=NONE ctermbg=NONE
		hi StatusLine   guibg=NONE ctermbg=NONE
		]])
	end,
}
