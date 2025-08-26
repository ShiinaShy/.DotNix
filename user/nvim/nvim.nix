# Neovim config
{ config, lib, pkgs, inputs, ...}:
{
  home-manager.users.shiina = {config, ...}:
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

        set number relativenumber
        set signcolumn=yes
        filetype plugin on

        highlight Normal guibg=none
        highlight NonText guibg=none
        highlight Normal ctermbg=none
        highlight NonText ctermbg=none

        NvimTreeOpen

        set clipboard+=unnamedplus
      '';

      plugins = with pkgs.vimPlugins; [
        {
          plugin = lualine-nvim;
          config = toLua "require(\'lualine\').setup()";
        }
        {
          plugin = nvim-web-devicons;
          config = toLua "require(\'nvim-web-devicons\').setup()";
        }
        {
          plugin = nvim-tree-lua;
          config = fileToLua ./tree.lua;
        }
        {
          plugin = barbar-nvim;
          config = fileToLua ./barbar.lua;
        }

        (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-zig
        ]))
        {
          plugin = catppuccin-nvim;
          config = fileToLua ./colorscheme.lua;
        }
        {
          plugin = nvim-lspconfig;
          config = fileToLua ./lsp.lua;
        }

        cmp-nvim-lsp
        luasnip
        friendly-snippets
        {
          plugin = nvim-cmp;
          config = fileToLua ./cmp.lua;
        }
        {
          plugin = gitsigns-nvim;
          config = toLua "require(\'gitsigns\').setup()";
        }
      ];
    };
    home.file.".config/nvim/ftplugin/nix.vim".text = ''
      setlocal expandtab
      setlocal tabstop=2
      setlocal shiftwidth=2
    '';
  };
}
