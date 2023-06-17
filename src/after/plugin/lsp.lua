local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'lua_ls',
    'html',
    'bashls',
    'terraformls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select_opts),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        documentation = {
            max_height = 15,
            max_width = 60,
        }
    },
    formatting = {
        fields = { 'abbr', 'menu', 'kind' },
        format = function(entry, item)
            local short_name = {
                nvim_lsp = 'LSP',
                nvim_lua = 'nvim'
            }

            local menu_name = short_name[entry.source.name] or entry.source.name

            item.menu = string.format('[%s]', menu_name)
            return item
        end,
    },
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


--[[
lsp.on_attach(function()
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
end)
--[[
lsp.on_attach(function(bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)
]]

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
