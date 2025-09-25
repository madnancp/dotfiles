return {
	"marko-cerovac/material.nvim",
	name = "material",
	config = function()
		vim.g.material_style = "deep ocean"

		require("material").setup({
			disable = {
				colored_cursor = true,
				background = true,
				term_colors = true,
				eob_lines = true,
			},
			high_visibility = {
				darker = true,
				lighter = false,
			},
			async_loading = true,
			plugins = {
				"gitsigns",
				"nvim-cmp",
				"telescope",
				"which-key",
			},
			custom_highlights = function(colors)
				return {
					CursorLine = { bg = "#CCCCCC" },
					CursorLineNr = { fg = "#CCCCCC", bg = "NONE", bold = true },
					LineNr = { fg = colors.editor.line_numbers, bg = "NONE" },
					WinSeparator = { fg = colors.editor.line_numbers, bg = "NONE" },
					NormalFloat = { bg = "NONE" },
					FloatBorder = { bg = "NONE" },
					TelescopeNormal = { bg = "NONE" },
					TelescopeBorder = { bg = "NONE" },
					StatusLine = { bg = "NONE", fg = colors.editor.fg },
					StatusLineNC = { bg = "NONE", fg = colors.editor.line_numbers },
					Cursor = { fg = "NONE", bg = "#FFFFFF" },
				}
			end,
		})

		vim.cmd("colorscheme material")
	end,
}
