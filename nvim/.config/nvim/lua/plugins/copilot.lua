return {
	"github/copilot.vim",
	event = "InsertEnter",
	config = function()
		vim.g.copilot_no_tab_map = true

		vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
		vim.keymap.set("i", "<C-L>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
		vim.keymap.set("i", "<C-H>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
		vim.keymap.set("i", "<C-Space>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })
	end,
}
