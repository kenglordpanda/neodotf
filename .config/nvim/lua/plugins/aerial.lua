return {
	{
		"stevearc/aerial.nvim",
		opts = {
			backends = { "treesitter", "lsp" },
			lsp = {
				diagnostics_trigger_update = true,
				update_when_errors = true,
			},
			treesitter = {
				update_delay = 300,
			},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
