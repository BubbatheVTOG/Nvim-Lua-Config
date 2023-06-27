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
vim.keymap.set("n", "qq", ":q!<CR>")
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
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")

-- LSP
  -- Symbols and definition
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gc", require("telescope.builtin").lsp_references)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
-- vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)

  -- Diagnostics
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)

  -- Workspaces
vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
--vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)

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
