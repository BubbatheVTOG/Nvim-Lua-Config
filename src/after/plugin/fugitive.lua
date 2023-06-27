vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local Bubba_Fugitive = vim.api.nvim_create_augroup("Bubba_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = Bubba_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        -- NOTE: This sets the bind only in the fugitive buffer.
        -- Else we use the pull bind
        vim.keymap.set("n", "<leader>gp", function()
            vim.cmd.Git('push')
        end, opts)

        -- rebase always
        -- vim.keymap.set("n", "<leader>P", function()
        --     vim.cmd.Git({'pull',  '--rebase'})
        -- end, opts)

        -- NOTE: It allows me to easily set the branch I am pushing and any tracking
        -- needed if I did not set the branch up correctly
        vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", opts);
    end,
})

vim.keymap.set("n", "<leader>gf", ":Git fetch<CR>");
vim.keymap.set("n", "<leader>gp", ":Git pull<CR>");
