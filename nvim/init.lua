require("general")
require("keymaps")
require("autocmds")
require("lazy_bootstrap")

require("lazy").setup({
	require("plugins.lsp"),
	require("plugins.autopairs"),
	require("plugins.gitsigns"),
	require("plugins.cmp"),
	require("plugins.telescope"),
	require("plugins.coding"),
	require("plugins.lint"),
	require("plugins.theme"),
	require("plugins.core"),
	require("plugins.treesitter"),
	require("plugins.which_key"),
	require("plugins.others"),
	require("plugins.oil"),
	require("plugins.lualine"),
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
