local on_attach = function(_, bufnr)
    print("LSP attached to buffer: " .. bufnr)
    local bufmap = function(keys, func)
        vim.keymap.set('n', keys, func, {buffer = bufnr})
    end

    bufmap('<leader>r', vim.lsp.buf.rename)
    bufmap('<leader>a', vim.lsp.buf.code_action)

    bufmap('gd', vim.lsp.buf.definition)
    bufmap('dD', vim.lsp.buf.declaration)
    bufmap('gI', vim.lsp.buf.implementation)
    bufmap('<leader>D', vim.lsp.buf.type_definition)
    bufmap('<leader>f', function() 
        vim.lsp.buf.format()
        print("Formatting...")
    end)
    bufmap('gr', require('telescope.builtin').lsp_references)
    bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
    bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

    bufmap('K', vim.lsp.buf.hover)

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    signs = {
	text = {
	    [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
        },
    },
    underline = true,
    update_in_insert = true,
    float = {
        border = "rounded",
        source = true,
    },
    severity_sort = true,
})

vim.lsp.enable('nixd');
vim.lsp.config('nixd', {
    on_attach = on_attach,
    capabilities = capabilities,
});
vim.lsp.enable('zls');
vim.lsp.config('zls', {
    on_attach = on_attach,
    capabilities = capabilities,
});
vim.lsp.enable('tinymist');
