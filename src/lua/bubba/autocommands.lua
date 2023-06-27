vim.api.nvim_create_autocmd("FileType", {
	desc = "Move Help to the right",
	group = vim.api.nvim_create_augroup("HelpGroup", { clear = true }),
	callback = function(opts)
		if vim.bo[opts.buf].filetype == "help" then
			vim.cmd('wincmd L | setlocal nonumber | vertical resize 82')
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Make quick fix list editable",
	group = vim.api.nvim_create_augroup("QFEditable", { clear = true }),
	callback = function(opts)
		if vim.bo[opts.buf].filetype == "qf" then
			vim.opt.modifiable = true
		end
	end
})
