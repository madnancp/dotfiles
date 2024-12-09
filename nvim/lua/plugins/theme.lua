return {
	"aliqyan-21/darkvoid.nvim",
	config = function()
		require("darkvoid").setup({
			transparent = true,

			colors = {
				string = "#ffffff",
				func = "#fab387",
				kw = "#1bfd9c",
				identifier = "#cdd6f4",
				search_highlight = "#f38ba8",
			},
		})
		vim.cmd("colorscheme darkvoid")
		vim.api.nvim_set_hl(0, "@constructor", { fg = "#fab387" })
	end,
}

