return {
	{
		url = "https://codeberg.org/andyg/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		lazy = false,
		opts = {},
		config = function(_, opts)
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
			vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")
		end,
	},
}
