vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Quitting and Saving
vim.keymap.set("n", "<leader><leader>", ":w!<CR>")
vim.keymap.set("n", "qq", ":wq!<CR>")
vim.keymap.set("i", "jj", "<Esc>")

-- Copy
vim.keymap.set("v", "v", "$h")
vim.keymap.set("v", "Y", "\"*y")
vim.keymap.set("n", "Y", "y$")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Folds
vim.keymap.set("n", "<leader>ft", "za")
vim.keymap.set("n", "<leader>fo", ":fold<CR>")
vim.keymap.set("n", "<leader>fc", ":fold<CR>4li<CR><ESC>ka<SPACE><SPACE><ESC>i")
vim.keymap.set("n", "<leader>fn", ":fold<CR>4li<++><CR><ESC>A<++><ESC><S-o><BS><++><ESC>k2hi<SPACE><SPACE><ESC>i")

-- Movement for Wrapped Lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "0", "g0")
vim.keymap.set("n", "$", "g$")

-- Movement for Wrapped Lines in Operator Pending Mode
vim.keymap.set("o", "j", "gj")
vim.keymap.set("o", "k", "gk")

-- Resizing Split Buffers
vim.keymap.set("n", "=", ":vertical resize +10<CR>")
vim.keymap.set("n", "-", ":vertical resize -10<CR>")

-- Visual Horizontal Movement
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move Between Buffers
vim.keymap.set("n", "bn", ":bnext<CR>")
vim.keymap.set("n", "bp", ":bprevious<CR>")
vim.keymap.set("n", "bd", ":bdelete<CR>")

-- LSP
vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)

--[[
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
]]

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ev", "<cmd>e <PATH_TO_INIT.LUA> <CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader>so", function()
	vim.cmd("so")
end)
