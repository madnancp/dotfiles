return {
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup({
		transparent = true,
                default_file_explorer = true,
            })
        end
    }
