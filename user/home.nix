{ pkgs, ... }:
{
  _module.args.colors = import (import ./wal/pywal.nix { inherit pkgs; });
  imports = [
    ./theme.nix
    ./hyprland.nix
    ./nvim/nvim.nix
    ./tty.nix
    ./rofi.nix
    ./mako.nix
    ./ideavim.nix
    ./waybar/waybar.nix
    ./niri.nix
    ./qt/qt.nix
  ];

  home-manager.users.shiina = { ... }: {
    home.packages = [];
    programs = {
      librewolf = {
        enable = true;
        settings = {
          "widget.gtk.libadwaita-colors.enabled" = false;
          "general.autoScroll" = true;
          "browser.toolbars.bookmarks.visibility" = "newtab";
          "browser.compactmode.show" = true;
        };
      };
      thunderbird = {
        enable = true;
        profiles.default = {
          isDefault = true;
          settings = {
            "widget.gtk.libadwaita-colors.enabled" = false;
            "widget.gtk.native-context-menus" = true;
            "mail.ui.display.dateformat.today" = 2;
            "mailnews.wraplength" = 0;
            "intl.regional_prefs.use_os_locales" = true;
            "general.autoScroll" = true;
            "mail.accounthub.enabled" = false;
          };
        };
      };
    };

    # Set gimp configs in a hacky way :3c
    home.file.".config/GIMP/3.0" = {
      source =  ./gimp;
      recursive = true;
    };
  };
}
