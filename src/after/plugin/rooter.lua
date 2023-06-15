-- Vim-Rooter
-- -----------------------------------------------------------------------------
-- Change cwd.
-- cd =  +current buffer, -current window, -other windows, -current tab, -other tabs
-- tcd = +current buffer, +current window, -other windows, +current tab, -other tabs
-- lcd = +current buffer, +current window, -other windows, -current tab, -other tabs
vim.g.rooter_cd_cmd = 'tcd'
vim.g.rooter_change_directory_for_non_project_files = 'current'
vim.g.rooter_patterns = { '.git', 'package.json', '=src', '*.sln', 'Makefile', 'pom.xml' }
