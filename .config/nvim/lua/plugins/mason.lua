return {
	{
		"mason-org/mason.nvim",
		cond = not vim.g.vscode,
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		cond = not vim.g.vscode,
		opts = {
			ensure_installed = {
				"clangd",
				"gopls",
				"lua_ls",
				"harper_ls",
				"marksman",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", cond = not vim.g.vscode, opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"mfussenegger/nvim-lint",
		cond = not vim.g.vscode,
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				lua = { "selene" },
				c = { "cpplint" },
				cmake = { "cmakelint" },
				go = { "golangcilint" },
				python = { "flake8" },
				rust = { "clippy" },
				markdown = { "markdownlint" },
				dockerfile = { "hadolint" },
				yaml = { "yamllint" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
