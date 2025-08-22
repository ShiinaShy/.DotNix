vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    local function toggle_nvimtree()
       	if vim.fn.bufname():match 'NvimTree_' then
      		vim.cmd.wincmd 'p'
       	else
      		vim.cmd('NvimTreeFocus')
       	end
    end

    local bufmap = function(keys, func)
        vim.keymap.set('n', keys, func, {buffer = bufnr})
    end
    -- custom mappings
    bufmap('?', api.tree.toggle_help)
    bufmap('<CR>', api.node.open.edit)
    bufmap('<Tab>', api.node.open.preview)
    vim.keymap.set('n', '-', toggle_nvimtree, {noremap = true, silent = true })
end

require("nvim-tree").setup({
    on_attach = my_on_attach,
    actions = {
        open_file = {
            quit_on_open = false,
        }
    },
    renderer = {
	highlight_git = "name", 
	icons = { 
		git_placement = "signcolumn",
	},
    }
})

-- auto close
local function is_modified_buffer_open(buffers)
    for _, v in pairs(buffers) do
        if v.name:match("NvimTree_") == nil then
            return true
        end
    end
    return false
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if
            #vim.api.nvim_list_wins() == 1
            and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
            and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
        then
            vim.cmd("quit")
        end
    end,
})
