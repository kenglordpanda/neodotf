return {
	{
		"stevearc/oil.nvim",
		use_defaults_keymaps = false,
		opts = {
			view_options = {
				show_hidden = true,
				-- This function defines what is considered a "hidden" file
				is_hidden_file = function(name, bufnr)
					local m = name:match("^%.")
					return m ~= nil
				end,
				-- This function defines what will never be shown, even when `show_hidden` is set
				is_always_hidden = function(name, bufnr)
					return false
				end,
				natural_order = "fast",
				case_insensitive = false,
				sort = {
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},
			default_file_explorer = true,
			buf_options = {
				buflisted = false,
				bufhidden = "hide",
			},
			vim.keymap.set(
				"n",
				"<Leader>o",
				":Oil<cr>",
				{ desc = "Open Oil File Explorer", noremap = true, silent = true }
			),
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["ov"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["pv"] = "actions.preview",
				["ff"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				[".."] = "actions.parent",
				["cw"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
