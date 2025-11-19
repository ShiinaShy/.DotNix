{ inputs, ...}:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ./theme.nix
    ./hyprland.nix
    ./nvim/nvim.nix
    ./tty.nix
    ./ideavim.nix
    ./waybar/waybar.nix
  ];

  home-manager.users.shiina = { ... }: {
    home.packages = [];
    programs = {
      librewolf = {
        enable = true;
        settings = {
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
            "mail.ui.display.dateformat.today" = 2;
            "mailnews.wraplength" = 0;
            "intl.regional_prefs.use_os_locales" = true;
            "general.autoScroll" = true;
            "mail.accounthub.enabled" = false;
          };
        };
      };
    };

    # Set Config Files:
    home.file.".config/GIMP/3.0" = {
      # Hacky but works :3c
      source =  ../configs/GIMP;
      recursive = true;
    };
    # home.file.".config/waybar" = {
    #   source =  ../configs/waybar;
    #   recursive = true;
    # };
    home.file.".config/rofi/config.rasi".source = ../configs/rofi/config.rasi;
    home.file.".config/mako/config".source = ../configs/mako/config;

    # The state version is required and should stay at the version you originally installed.
    home.stateVersion = "23.11";
  };
}
