-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
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
		requires = { "nvim-tree/nvim-web-devicons" }, -- Optional, for file icons
	},
	--
	-- Add nvim-surround plugin
	{
		"kylechui/nvim-surround",
		version = "*", -- Use the latest stable release
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}
