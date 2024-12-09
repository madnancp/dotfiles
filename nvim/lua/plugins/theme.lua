return {
	"aliqyan-21/darkvoid.nvim",
	config = function()
		require("darkvoid").setup({
			transparent = true,

			colors = {
				-- line_nr = "#585b70",
				line_nr = "#616263",
				string = "#ffffff",
				func = "#fab387",
				kw = "#1bfd9c",
				identifier = "#cdd6f4",
				type = "#89b4fa",
				type_builtin = "#b4befe",
				search_highlight = "#f38ba8",
				bracket = "#94e2d5",
				preprocessor = "#f5c2e7",
				bool = "#f9e2af",
				constant = "#cba6f7",
			},
		})
		vim.cmd("colorscheme darkvoid")
		vim.api.nvim_set_hl(0, "@constructor", { fg = "#fab387" })
	end,
}
