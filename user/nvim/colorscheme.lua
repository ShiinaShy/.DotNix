require("catppuccin").setup {
    transparent_background = true,

    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
    },

    -- Set linenumbers to someting readable
    custom_highlights = function(colors)
        return {
            LineNrAbove = { fg = colors.surface3 },
            LineNr = { fg = "#cba6f7" },
            LineNrBelow = { fg = colors.surface3 },
        }
    end
}

vim.cmd.colorscheme "catppuccin-mocha"

