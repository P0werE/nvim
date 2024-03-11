-- local lsp = require('lsp-zero').preset({})
-- local cmp = require('cmp')
--
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<C-y'] = cmp.mapping.confirm({select=true}),
--     ['<C-Space>'] = cmp.mapping.complete(),
-- })
--
-- lsp.setup_nvim_cmp({
--     mapping = cmp_mappings
-- })
--
--
-- lsp.on_attach(function(client, bufnr)
--     local opts = {buffer = bufnr, remap = false}
--     lsp.default_keymaps({buffer = bufnr})
--
--     vim.keymap.set('n', "gd", function () vim.lsp.buf.definition() end, opts)
--     vim.keymap.set('n', "K", function () vim.lsp.buf.hover() end, opts)
--     vim.keymap.set('n', "<leader>vws", function () vim.lsp.buf.workspace_symbol() end, opts)
--     vim.keymap.set('n', "<leader>vd", function () vim.diagnostic.open_float() end, opts)
--     vim.keymap.set('n', "[d", function () vim.diagnostic.goto_next() end, opts)
--     vim.keymap.set('n', "]d", function () vim.diagnostic.goto_prev() end, opts)
--
--     vim.keymap.set('n', "<leader>vca", function () vim.lsp.buf.code_action() end, opts)
--     vim.keymap.set('n', "<leader>vrr", function () vim.lsp.buf.references() end, opts)
--     vim.keymap.set('n', "<leader>vrn", function () vim.lsp.buf.rename() end, opts)
--     vim.keymap.set('i', "<C-h>", function () vim.lsp.buf.signature_help() end, opts)
--
--     lsp.buffer_autoformat()
-- end)
--
--
--
-- lsp.setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    lsp_zero.buffer_autoformat()
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'rust_analyzer' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})
