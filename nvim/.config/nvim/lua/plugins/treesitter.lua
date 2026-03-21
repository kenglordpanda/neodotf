-- Failed to run `config` for nvim-treesitter
--
-- /home/khang/.config/nvim/lua/plugins/treesitter.lua:46: attempt to call field 'install' (a nil value)
--
-- # stacktrace:
--   - ~/.config/nvim/lua/plugins/treesitter.lua:46 _in_ **config**
--   - ~/.config/nvim/lua/config/lazy.lua:19 - ~/.dotfiles/.config/nvim/init.lua:3
return {
	{
		"nvim-treesitter/nvim-treesitter",
		cond = not vim.g.vscode,
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		---@class TSConfig
		opts = {
			ensure_installed = {
				"angular",
				"bash",
				"c",
				"cpp",
				"cmake",
				"css",
				"dockerfile",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"rust",
				"scss",
				"toml",
				"tsx",
				"typescript",
				"yaml",
			},
			highlight = {
				enable = true,
				disable = { "latex" }, -- Disable TS highlighting for LaTeX
			},
			additional_vim_regex_highlighting = { "latex" },
		},
		config = function(_, opts)
			-- install parsers from custom opts.ensure_installed
			if opts.ensure_installed and #opts.ensure_installed > 0 then
				require("nvim-treesitter").install(opts.ensure_installed)
				-- register and start parsers for filetypes
				for _, parser in ipairs(opts.ensure_installed) do
					local filetypes = parser -- In this case, parser is the filetype/language name
					vim.treesitter.language.register(parser, filetypes)

					vim.api.nvim_create_autocmd({ "FileType" }, {
						pattern = filetypes,
						callback = function(event)
							vim.treesitter.start(event.buf, parser)
						end,
					})
				end
			end

			-- Auto-install and start parsers for any buffer
			vim.api.nvim_create_autocmd({ "BufRead" }, {
				callback = function(event)
					local bufnr = event.buf
					local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

					-- Skip if no filetype
					if filetype == "" then
						return
					end

					-- Check if this filetype is already handled by explicit opts.ensure_installed config
					for _, filetypes in pairs(opts.ensure_installed) do
						local ft_table = type(filetypes) == "table" and filetypes or { filetypes }
						if vim.tbl_contains(ft_table, filetype) then
							return -- Already handled above
						end
					end

					-- Get parser name based on filetype
					local parser_name = vim.treesitter.language.get_lang(filetype) -- might return filetype (not helpful)
					if not parser_name then
						return
					end

					if parser_name == "latex" then
						return
					end

					-- Try to get existing parser (helpful check if filetype was returned above)
					local parser_configs = require("nvim-treesitter.parsers")
					if not parser_configs[parser_name] then
						return -- Parser not available, skip silently
					end

					local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

					if not parser_installed then
						-- If not installed, install parser synchronously
						require("nvim-treesitter").install({ parser_name }):wait(30000)
					end

					-- let's check again
					parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

					if parser_installed then
						-- Start treesitter for this buffer
						vim.treesitter.start(bufnr, parser_name)
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			multiwindow = false, -- Enable multiwindow support.
			max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 20, -- Maximum number of lines to show for a single context
			trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
			zindex = 20, -- The Z-index of the context window
			on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = true, -- Auto close on trailing </
				},
			})
		end,
	},
}
