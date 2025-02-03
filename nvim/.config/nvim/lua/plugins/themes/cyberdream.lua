return {
	"scottmckendry/cyberdream.nvim",
	config = function()
		require("cyberdream").setup({
			transparent = true,
			italic_comments = true,
			extensions = {
				telescope = false,
			},
		})
		vim.cmd("colorscheme cyberdream")
	end,
}
