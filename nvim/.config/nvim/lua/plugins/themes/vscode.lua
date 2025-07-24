return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Load the theme with transparent background enabled
		require("vscode").setup({
			transparent = true, -- enable transparent background
			italic_comments = true,
			disable_nvimtree_bg = true, -- disable background for nvim-tree if used
		})

		-- Apply the colorscheme
		require("vscode").load()

		-- Override additional highlights for full transparency
		vim.cmd([[
      hi Normal         guibg=NONE ctermbg=NONE
      hi NormalNC       guibg=NONE ctermbg=NONE
      hi NormalFloat    guibg=NONE ctermbg=NONE
      hi FloatBorder    guibg=NONE ctermbg=NONE
      hi LineNr         guibg=NONE ctermbg=NONE
      hi CursorLineNr   guibg=NONE ctermbg=NONE
      hi SignColumn     guibg=NONE ctermbg=NONE
      hi VertSplit      guibg=NONE ctermbg=NONE
      hi StatusLine     guibg=NONE ctermbg=NONE
      hi StatusLineNC   guibg=NONE ctermbg=NONE
      hi WinSeparator   guibg=NONE ctermbg=NONE
      hi CursorLine     guibg=NONE ctermbg=NONE
      hi Pmenu          guibg=NONE ctermbg=NONE
      hi PmenuSel       guibg=NONE ctermbg=NONE
      hi TelescopeNormal   guibg=NONE ctermbg=NONE
      hi TelescopeBorder   guibg=NONE ctermbg=NONE
      hi GitSignsAdd       guibg=NONE ctermbg=NONE
      hi GitSignsChange    guibg=NONE ctermbg=NONE
      hi GitSignsDelete    guibg=NONE ctermbg=NONE
      hi DiffAdd           guibg=NONE ctermbg=NONE
      hi DiffChange        guibg=NONE ctermbg=NONE
      hi DiffDelete        guibg=NONE ctermbg=NONE
    ]])
	end,
}
