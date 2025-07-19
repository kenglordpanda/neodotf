return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = "which_key",
					},
				},
			},
			pickers = {},
			extensions = { "harpoon" },
		},
		config = function(_, opts)
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope Live Grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope Buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope Help" })
		end,
	},
}
