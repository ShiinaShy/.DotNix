{ inputs, ...}:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ./theme.nix
    ./hyprland.nix
    ./nvim/nvim.nix
    ./tty.nix
    ./rofi.nix
    ./mako.nix
    ./ideavim.nix
    ./waybar/waybar.nix
    ./wal/wal.nix
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

    # The state version is required and should stay at the version you originally installed.
    home.stateVersion = "23.11";
  };
}
