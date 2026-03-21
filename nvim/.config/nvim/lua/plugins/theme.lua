return {
	{
		"Mofiqul/dracula.nvim",
		cond = not vim.g.vscode,
	},
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000, cond = not vim.g.vscode },
}
