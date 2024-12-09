return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 30,
				},
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
			})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}
