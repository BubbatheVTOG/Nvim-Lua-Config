local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_utils = require('telescope.actions.utils')
local action_state = require('telescope.actions.state')

-- file search
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>ht', builtin.help_tags, {})

-- text serch
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})

-- buffers
vim.keymap.set('n', '<leader>bu', builtin.buffers, {})

-- search word under cursor
vim.keymap.set('n', '<leader>pw', function()
	builtin.grep_string({ default_text = vim.fn.expand("<cword>") })
end)

-- search for file under cursor
vim.keymap.set('n', '<leader>pw', function()
	builtin.live_grep({ default_text = vim.fn.expand("<cword>") })
end)

-- git branches
vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>')

local function single_or_multi_select(prompt_bufnr)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	--[[
	local has_multi_selection = (next(current_picker:get_multi_selection()) ~= nil)

	if (has_multi_selection) then
		-- apply function to each selection
		action_utils.map_selections(prompt_bufnr, function (selection)
            --local filename = selection[1]
            vim.cmd(':cexpr ' .. selection)
        end)
		vim.cmd(':cexpr ' .. current_picker:get_multi_selection())
		]]

	local has_multi_selection = (next(current_picker:get_multi_selection()) ~= nil)
	if (has_multi_selection) then
		actions.send_selected_to_qflist(prompt_bufnr)
		actions.open_qflist()
	else
		actions.file_edit(prompt_bufnr)
	end
end

require('telescope').setup {
	defaults = {
		i = {
			["<CR>"] = single_or_multi_select,
		},
		n = {
			["<CR>"] = single_or_multi_select,
		},
	},
	pickers = {
		find_files = {
		},
		git_files = {
		},
		git_branches = {
			mappings = {
				i = { ["<CR>"] = actions.git_switch_branch },
			},
		},
	},
	extensions = {
	}
}

require('telescope').load_extension('harpoon')
