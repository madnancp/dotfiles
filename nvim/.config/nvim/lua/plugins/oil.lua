return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			transparent = true,
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					return vim.tbl_contains({
						".git",
						".venv",
						"node_modules",
						"__pycache__",
					}, name)
				end,
			},
		})
	end,
}
