return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			compile = false,
			transparent = true,
			dimInactive = false,
			terminalColors = true,
			theme = "dragon",
			background = {
				dark = "dragon",
				light = "lotus",
			},
			overrides = function(colors)
				return {
					Normal = { bg = "none" },
					NormalNC = { bg = "none" },
					NormalFloat = { bg = "none" },
					FloatBorder = { bg = "none" },
					Pmenu = { bg = "none" },
					PmenuSel = { bg = "none", fg = colors.theme.ui.fg },
					TelescopeNormal = { bg = "none" },
					TelescopeBorder = { bg = "none" },
					VertSplit = { bg = "none" },
					SignColumn = { bg = "none" },
					StatusLine = { bg = "none" },
					WinBar = { bg = "none" },
					WinSeparator = { bg = "none" },
					CursorLine = { bg = "none" },
					ColorColumn = { bg = "none" },
					LineNr = { fg = colors.palette.sumiInk3, bg = "none" },
					CursorLineNr = { fg = colors.palette.crystalBlue, bg = "none" },
					GitSignsAdd = { bg = "none" },
					GitSignsChange = { bg = "none" },
					GitSignsDelete = { bg = "none" },
				}
			end,
		})

		vim.cmd("colorscheme kanagawa")
		vim.cmd([[
			hi Cursor guifg=NONE guibg=#ffffff
			hi CursorLineNr guifg=#b0adac
			hi LineNr guifg=#b0adac
			hi ColorColumn guibg=#403f3e
		]])
	end,
}
