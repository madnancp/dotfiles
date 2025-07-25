return {
	"AlexvZyl/nordic.nvim",
	lazy = false, -- load immediately at startup
	priority = 1000, -- load before other plugins
	config = function()
		require("nordic").setup({
			transparent_bg = false, -- set to true if you want a transparent background
			bold_keywords = true,
			italic_comments = true,
			reduced_blue = true,
			cursorline = {
				bold = true,
				theme = "dark", -- or "light"
			},
			telescope = {
				style = "flat", -- or "classic"
			},
			leap = { dim_backdrop = true },
		})

		vim.cmd.colorscheme("nordic")
		vim.cmd([[
      hi Normal       guibg=NONE ctermbg=NONE
      hi NormalNC     guibg=NONE ctermbg=NONE
      hi NormalFloat  guibg=NONE ctermbg=NONE
      hi SignColumn   guibg=NONE ctermbg=NONE
      hi LineNr       guibg=NONE ctermbg=NONE
      hi CursorLineNr guibg=NONE ctermbg=NONE
      hi VertSplit    guibg=NONE ctermbg=NONE
      hi StatusLine   guibg=NONE ctermbg=NONE
      hi StatusLineNC guibg=NONE ctermbg=NONE
      hi Pmenu        guibg=NONE ctermbg=NONE
      hi PmenuSel     guibg=NONE ctermbg=NONE
      hi FloatBorder  guibg=NONE ctermbg=NONE
      hi TelescopeNormal guibg=NONE ctermbg=NONE
      hi TelescopeBorder guibg=NONE ctermbg=NONE
      hi ColorColumn  guibg=NONE ctermbg=NONE
      hi CursorLine   guibg=NONE ctermbg=NONE
      hi WinSeparator guibg=NONE ctermbg=NONE
      hi GitSignsAdd      guibg=NONE ctermbg=NONE
      hi GitSignsChange   guibg=NONE ctermbg=NONE
      hi GitSignsDelete   guibg=NONE ctermbg=NONE
      hi DiffAdd          guibg=NONE ctermbg=NONE
      hi DiffChange       guibg=NONE ctermbg=NONE
      hi DiffDelete       guibg=NONE ctermbg=NONE
    ]])
	end,
}
