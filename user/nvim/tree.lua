local tree = {}
tree.open = function ()
   require'bufferline.state'.set_offset(31, 'FileTree')
   require'nvim-tree'.find_file(true)
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
end

return tree

local on_attach = function(_, bufnr)

    local bufmap = function(keys, func)
        vim.keymap.set('n', keys, func, {buffer = bufnr})
    end

    bufmap('T', tree.open)
end
