return {
	{
		"stevearc/conform.nvim",
		cond = not vim.g.vscode,
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format " },
				cmake = { "gesermi" },
				python = { "isort", "black" },
				go = { "golines", "goimports-reviser", "gofumpt" },
				latex = { "latexindent" },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "markdownlint" },
				rust = { "rustfmt", lsp_format = "fallback" },
				yaml = { "yamlfmt", stop_after_first = true },
				toml = { "taplo" },
				zig = { lsp_format = "fallback" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
			log_level = vim.log.levels.ERROR,
			notify_on_error = true,
			notify_no_formatters = true,
		},
	},
}
