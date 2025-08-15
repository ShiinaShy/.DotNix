local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, {noremap = true, silent = true})
end
-- Move to previous/next
bufmap('<A-,>', '<Cmd>BufferPrevious<CR>')
bufmap('<A-.>', '<Cmd>BufferNext<CR>')

-- Re-order to previous/next
bufmap('<A-<>', '<Cmd>BufferMovePrevious<CR>')
bufmap('<A->>', '<Cmd>BufferMoveNext<CR>')

-- Goto buffer in position...
bufmap('<A-1>', '<Cmd>BufferGoto 1<CR>')
bufmap('<A-2>', '<Cmd>BufferGoto 2<CR>')
bufmap('<A-3>', '<Cmd>BufferGoto 3<CR>')
bufmap('<A-4>', '<Cmd>BufferGoto 4<CR>')
bufmap('<A-5>', '<Cmd>BufferGoto 5<CR>')
bufmap('<A-6>', '<Cmd>BufferGoto 6<CR>')
bufmap('<A-7>', '<Cmd>BufferGoto 7<CR>')
bufmap('<A-8>', '<Cmd>BufferGoto 8<CR>')
bufmap('<A-9>', '<Cmd>BufferGoto 9<CR>')
bufmap('<A-0>', '<Cmd>BufferLast<CR>')
-- Close buffer
bufmap('<A-c>', '<Cmd>BufferClose<CR>')

require('barbar').setup {
    sidebar_filetypes = {
        NvimTree = true,
    }
}
