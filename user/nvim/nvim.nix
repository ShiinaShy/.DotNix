# Neovim config
{ pkgs, ...}:
{
  home-manager.users.shiina = {...}:
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    fileToLua = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    programs.neovim = {
      enable = true;
      extraConfig = ''
        set expandtab
        set tabstop=4
        set shiftwidth=4
        set nowrap

        set number relativenumber
        set signcolumn=yes
        filetype plugin on

        highlight Normal guibg=none
        highlight NonText guibg=none
        highlight Normal ctermbg=none
        highlight NonText ctermbg=none


        nnoremap <SPACE> <Nop>
        let mapleader=" "

        set clipboard+=unnamedplus

        
        " Paste without copy
        xnoremap <leader>p "_dP

        " Open Telescope
        nnoremap <leader>g <cmd>Telescope find_files<cr>
        nnoremap <leader>f <cmd>Telescope lsp_document_symbols<cr>

        " NvimTreeOpen
        nnoremap <leader>- <cmd>NvimTreeToggle<cr>

        " Auto Brackets
        " inoremap ( ()<Left>
        " inoremap [ []<Left>
        " inoremap { {}<Left>
        " inoremap <expr> <CR> search('{\%#}', 'n') ? "\<CR>\<CR>\<Up>\<C-f>" : "\<CR>"

        " Evil save
        nnoremap <C-s> <cmd>w<cr>
      '';

      plugins = with pkgs.vimPlugins; [
        # UI
        {
          plugin = catppuccin-nvim;
          config = fileToLua ./colorscheme.lua;
        }
        {
          plugin = nvim-web-devicons;
          config = toLua "require(\'nvim-web-devicons\').setup()";
        }
        {
          plugin = indent-blankline-nvim;
          config = toLua "require(\'ibl\').setup({indent = {char = \'▏\'}})";
        }
        {
          plugin = lualine-nvim;
          config = toLua "require(\'lualine\').setup()";
        }
        {
          plugin = barbar-nvim;
          config = fileToLua ./barbar.lua;
        }

        # Tools
        {
          plugin = nvim-tree-lua;
          config = fileToLua ./tree.lua;
        }
        {
          plugin = telescope-fzf-native-nvim;
          config = fileToLua ./telescope.lua;
        }

        # LSP 
        cmp-nvim-lsp
        luasnip
        friendly-snippets
        {
          plugin = nvim-lspconfig;
          config = fileToLua ./lsp.lua;
        }
        {
          plugin = nvim-cmp;
          config = fileToLua ./cmp.lua;
        }
        {
          plugin = gitsigns-nvim;
          config = toLua "require(\'gitsigns\').setup()";
        }

        # Treesitter
        (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-zig
          p.tree-sitter-typst
        ]))
        
        # Typst
        {
          plugin = typst-preview-nvim;
          config = toLua ''require('typst-preview').setup{
              dependencies_bin = {
                ['tinymist'] = nil,
                ['websocat'] = nil
              },
          }'';
        }
      ];
    };

    # Filetype Plugin Config
    home.file.".config/nvim/ftplugin/nix.vim".text = ''
      setlocal expandtab
      setlocal tabstop=2
      setlocal shiftwidth=2
    '';
  };
}
