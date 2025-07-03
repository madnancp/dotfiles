require("general")
require("keymaps")
require("autocmds")
require("lazy_bootstrap")

require("lazy").setup({
	require("plugins.lsp"),
	require("plugins.autopairs"),
	require("plugins.autotag"),
	require("plugins.gitsigns"),
	require("plugins.cmp"),
	require("plugins.telescope"),
	require("plugins.coding"),
	require("plugins.lint"),
	require("plugins.themes.vscode"),
	require("plugins.core"),
	require("plugins.treesitter"),
	require("plugins.others"),
	require("plugins.oil"),
	require("plugins.harpoon"),
	require("plugins.lazygit"),
	require("plugins.markdown"),
	-- require("plugins.copilot"),
	require("plugins.toggleterm"),
})
