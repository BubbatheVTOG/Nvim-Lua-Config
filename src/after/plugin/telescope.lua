local builtin = require('telescope.builtin')

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
    builtin.grep_string({ default_text = vim.fn.expand("<cword>")})
end)

-- search for file under cursor
vim.keymap.set('n', '<leader>pw', function()
    builtin.live_grep({ default_text = vim.fn.expand("<cword>")})
end)

require('telescope').setup{
  defaults = {
  },
  pickers = {
    find_files = {
    }
  },
  extensions = {
  }
}
