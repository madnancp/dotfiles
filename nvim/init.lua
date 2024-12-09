require("general")
require("appearance")
require("keymaps")
require("autocmds")
require("lazy_bootstrap")


require("lazy").setup({
	require("plugins.lsp"),
	require("plugins.autopairs"),
	require("plugins.gitsigns"),
	require("plugins.cmp"),
	require("plugins.indent_line"),
	require("plugins.telescope"),
	require("plugins.coding"),
	require("plugins.lint"),
	require("plugins.theme"),
	require("plugins.core"),
	require("plugins.treesitter"),
	require("plugins.nvim_tree"),
	require("plugins.which_key"),
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
