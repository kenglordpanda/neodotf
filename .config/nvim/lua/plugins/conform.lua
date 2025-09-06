return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format " },
				cmake = { "gesermi" },
				python = { "isort", "black" },
				go = { "golines", "goimports-reviser", "gofumpt" },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "markdownlint" },
				rust = { lsp_format = "fallback" },
				yaml = { "prettierd", "prettier", "yamlfmt", stop_after_first = true },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		},
		config = function() end,
	},
}
