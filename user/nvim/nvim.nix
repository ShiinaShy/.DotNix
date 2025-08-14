# Neovim config
{ config, lib, pkgs, ...}:
{
  home-manager.users.shiina = {config, ...}:
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    fileToLua = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    programs.neovim = {
      enable = true;
      # extraConfig = ''
      #   set number relativenumber
      #   highlight Normal guibg=none
      #   highlight NonText guibg=none
      #   highlight Normal ctermbg=none
      #   highlight NonText ctermbg=none
      # '';

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
          config = toLua "require(\'nvim-tree\').setup()";
        }
        barbar-nvim

        (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-zig
        ]))

        {
          plugin = nvim-lspconfig;
          config = toLua ''
            vim.lsp.enable('nixd');
          '';
        }

        # (nvim-treesitter.withPlugins (p: [
        #   p.tree-sitter-nix
        #   p.tree-sitter-zig
        # ]))
      ];
    };
  };
}
