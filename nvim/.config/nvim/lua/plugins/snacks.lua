return {
	{
		"folke/snacks.nvim",
		cond = not vim.g.vscode,
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			animate = { enabled = true },
			bigfile = { enabled = true },
			bufdelete = { enabled = true },
			dashboard = { enabled = false },
			debug = { enabled = false },
			dim = { enabled = true },
			explorer = { enabled = false },
			git = { enabled = true },
			gitbrowse = { enabled = true },
			image = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			layout = { enabled = true },
			lazygit = { enabled = true },
			notifier = { enabled = true },
			notify = { enabled = true },
			picker = { enabled = false },
			profiler = { enabled = false },
			quickfile = { enabled = true },
			rename = { enabled = false },
			scope = { enabled = true },
			scratch = { enabled = false },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			terminal = { enabled = false },
			toggle = { enabled = true },
			util = { enabled = true },
			win = { enabled = true },
			words = { enabled = true },
			zen = { enabled = true },
		},
	},
}
