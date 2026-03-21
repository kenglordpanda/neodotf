-- This file is for keybinds that need to be configured after the plugin setup
--

-- Fuzzy Lua Keymaps
--- @param mode string The mode this keybind should be used in (normal, insert, etc...)
--- @param sequence string The Keybind (should be a sequence of keystrokes)
--- @param action string The Command (:COMMAND OPTS)
--- @param description string Description of what this keybind accomplishes (for which-key)
--- @param is_non_recursive boolean Can the keybind not trigger itself - defined outcome
--- @param is_silent boolean Notifies on activation
--- @param has_leader boolean whether leader key is needed
local config_kmp = function(mode, sequence, action, description, is_non_recursive, is_silent, has_leader)
	if has_leader == true or has_leader == nil then
		sequence = "<Leader>" .. sequence
	end
	action = action .. "<CR>"
	local opts = { desc = description, noremap = is_non_recursive, silent = is_silent }
	if opts.noremap == nil then
		opts.noremap = true
	end
	if opts.silent == nil then
		opts.silent = true
	end
	vim.keymap.set(mode, sequence, action, opts)
end

-- File and Buf

config_kmp("n", "fzm", ":FzfLua", "Fuzzy Menu")
config_kmp("n", "fzb", ":FzfLua buffers", "Fuzzy Buffers")
config_kmp("n", "fzq", ":FzfLua quickfix", "Fuzzy Quickfix List")
config_kmp("n", "fzl", ":FzfLua loclist", "Fuzzy Location List")
config_kmp("n", "fzr", ":FzfLua resume", "Fuzzy Last Resume")

-- Search
config_kmp("n", "fzsr", ":FzfLua grep", "Fuzzy Grep")
config_kmp("n", "fzsw", ":FzfLua grep_cword", "Fuzzy Grep Current Word")
config_kmp("n", "fzsW", ":FzfLua grep_cWORD", "Fuzzy Grep Current WORD")
config_kmp("n", "fzsb", ":FzfLua grep_curbuf", "Fuzzy Grep Current Buffer")
config_kmp("n", "fzsp", ":FzfLua grep_project", "Fuzzy Grep Current Project")
config_kmp("n", "fzsq", ":FzfLua grep_quickfix", "Fuzzy Grep Quickfix")
config_kmp("n", "fzsl", ":FzfLua grep_loclist", "Fuzzy Grep Location List")

-- Live Search
config_kmp("n", "fzlr", ":FzfLua live_grep", "Fuzzy Live Grep")
config_kmp("n", "fzlb", ":FzfLua lgrep_curbuf", "Fuzzy Live Grep Current Buffer")
config_kmp("n", "fzlp", ":FzfLua live_grep_native", "Fuzzy Live Grep Current Project")
config_kmp("n", "fzlq", ":FzfLua lgrep_quickfix", "Fuzzy Live Grep Quickfix")
config_kmp("n", "fzl", ":FzfLua lgrep_loclist", "Fuzzy Live Grep Location List")

-- Git
config_kmp("n", "fzgf", ":FzfLua git_files", "Fuzzy Git Files")
config_kmp("n", "fzgs", ":FzfLua git_status", "Fuzzy Git Status")
config_kmp("n", "fzgd", ":FzfLua git_diff", "Fuzzy Git Diff")
config_kmp("n", "fzgh", ":FzfLua git_hunks", "Fuzzy Git Hunks")
config_kmp("n", "fzgc", ":FzfLua git_commits", "Fuzzy Git Commits")
config_kmp("n", "fzglb", ":FzfLua git_bcommits", "Fuzzy Git Commits in Buffer")
config_kmp("n", "fzgw", ":FzfLua git_blame", "Fuzzy Git Blame")
config_kmp("n", "fzgh", ":FzfLua git_branches", "Fuzzy Git Branches")
config_kmp("n", "fzgt", ":FzfLua git_tags", "Fuzzy Git Tags")
config_kmp("n", "fzgh", ":FzfLua git_stash", "Fuzzy Git Stash")
