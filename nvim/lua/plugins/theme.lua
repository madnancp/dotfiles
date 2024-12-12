return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "main",
			dark_variant = "main",

			enable = {
				terminal = true,
				legacy_highlights = true,
				migrations = true,
			},

			styles = {
				bold = false,
				italic = true,
				transparency = true,
			},

			highlight_groups = {
				Comment = { fg = "#363738" },
				LineNr = { fg = "#cccfce" },
			},
		})
		vim.cmd("colorscheme rose-pine")
	end,
}
