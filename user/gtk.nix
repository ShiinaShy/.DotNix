# GTK Config
{ config, lib, pkgs, ...}:
{
    home-manager.users.shiina.gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus";
        package = pkgs.papirus-icon-theme;
      };
      theme = {
        name = "Omni";
        package = pkgs.omni-gtk-theme;
      };
    };
  }
