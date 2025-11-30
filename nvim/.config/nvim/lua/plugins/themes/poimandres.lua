return {
	"olivercederborg/poimandres.nvim",
	name = "poimandres",
	config = function()
		require("poimandres").setup({
			disable_background = true,
			disable_float_background = true,
			bold_vert_split = false,
			disable_italics = false,
			dim_nc_background = true,
		})

		vim.cmd("colorscheme poimandres")

		vim.cmd([[
		hi Visual guibg=#2a2a2a guifg=NONE gui=NONE
		hi ColorColumn guibg=#202020 ctermbg=236
		hi CursorLine   guibg=NONE ctermbg=NONE
		hi StatusLine  guibg=NONE, guifg=#FFFFFF
		hi Cursor  guifg=NONE, guibg=#00d992
		]])
	end,
}
