return {
	{
		"nvim-mini/mini.icons",
		cond = not vim.g.vscode,
		version = "*",
		config = function()
			require("mini.icons").setup()
		end,
	},
	{
		"nvim-mini/mini.completion",
		cond = not vim.g.vscode,
		version = "*",
		config = function()
			require("mini.completion").setup()
		end,
	},
	{
		"nvim-mini/mini.comment",
		version = "*",
		config = function()
			require("mini.comment").setup()
		end,
	},
	{
		"nvim-mini/mini.align",
		version = "*",
		config = function()
			require("mini.align").setup()
		end,
	},
	{
		"nvim-mini/mini.move",
		version = "*",
		config = function()
			require("mini.move").setup()
		end,
	},
	{
		"nvim-mini/mini.pairs",
		version = "*",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"nvim-mini/mini.snippets",
		cond = not vim.g.vscode,
		version = "*",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("mini.snippets").setup({
				snippets = {
					require("mini.snippets").gen_loader.from_lang(),
				},
			})
		end,
	},
}
