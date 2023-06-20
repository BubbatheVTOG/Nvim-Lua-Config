-- White Space
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- File
-- vim.api.nvim_command('filetype plugin indent on')
vim.opt.fileformats = {'unix', 'dos', 'mac'}
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.path:append('**')
vim.opt.matchpairs:append("<:>")

-- Wrap
vim.opt.wrap = true
vim.opt.showbreak = '>> '

-- Undo options
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

-- Display/Split
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = {"80","120"}
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.visualbell = false

-- Completion
vim.opt.completeopt = {"longest","menuone","preview"}
vim.opt.shortmess:append("c")
vim.opt.tags = {'tags'}

-- Tweaks
vim.opt.updatetime = 50
vim.opt.clipboard = {"unnamed","unnamedplus"}
