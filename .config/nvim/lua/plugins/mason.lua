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
				"asm_lsp",
				"bashls",
				"clangd",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"markdown_oxide",
				"neocmake",
				"pyright",
				"rust_analyzer",
				"tailwindcss",
				"texlab",
				"ts_ls",
				"taplo",
				"yamlls",
				"zls",
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
