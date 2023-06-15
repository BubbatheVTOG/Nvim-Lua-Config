require("bubba.set")
require("bubba.remap")
require("bubba.packer")
require("bubba.autocommands")

-- NOTE:
--[[
local api = vim.api
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
]]

local augroup = vim.api.nvim_create_augroup
local BubbaGroup = augroup('Bubba', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
	require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
	group = yank_group,
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 40,
		})
	end,
})

autocmd({"BufWritePre"}, {
	group = BubbaGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
