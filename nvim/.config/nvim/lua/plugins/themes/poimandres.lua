return {
	"olivercederborg/poimandres.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("poimandres").setup({
			bold_vert_split = false, -- use bold vertical split lines
			dim_nc_background = true, -- dim inactive windows
			disable_background = false, -- make bg transparent
			disable_float_background = false,
			disable_italics = false,
		})

		vim.cmd.colorscheme("poimandres")
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
