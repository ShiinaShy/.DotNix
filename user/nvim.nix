# Neovim config
{ config, lib, pkgs, ...}:
{
  home-manager.users.shiina = {config, ...}:
  {
    programs.neovim = {
      enable = true;
    };
  };
}
