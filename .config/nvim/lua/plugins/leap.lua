return {
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		lazy = false,
		opts = {},
		config = function(_, opts)
			require("leap").add_default_mappings()
		end,
	},
}
