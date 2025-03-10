return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<C-\>]],
				direction = "float",
				float_opts = {
					border = "rounded",
					winblend = 10,
				},
				highlights = {
					FloatBorder = { link = "Normal" },
				},
				shade_terminals = true,
				shading_factor = 2,
				persist_size = true,
				persist_mode = true,
			})

			vim.keymap.set(
				"n",
				"<leader>th",
				"<cmd>ToggleTerm size=20 direction=horizontal<cr>",
				{ desc = "Horizontal Terminal" }
			)
			vim.keymap.set(
				"n",
				"<leader>tv",
				"<cmd>ToggleTerm size=40 direction=vertical<cr>",
				{ desc = "Vertical Terminal" }
			)
			vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Floating Terminal" })
			vim.keymap.set(
				"n",
				"<leader>td",
				"<cmd>ToggleTerm size=40 dir=~/Desktop direction=horizontal<cr>",
				{ desc = "Desktop Terminal" }
			)

			-- Terminal Mode Escape to Normal Mode
			vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })
		end,
	},
}
