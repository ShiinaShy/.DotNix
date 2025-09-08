{config, pkgs, inputs, ...}:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ./theme.nix
    ./hyprland.nix
    ./nvim/nvim.nix
  ];


  home-manager.users.shiina = { config, pkgs, ... }: {
    home.packages = [];
    programs = {
      bash.enable = true;
      zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        autosuggestion.highlight = "fg=red,italic,underline";
        syntaxHighlighting = {
          enable = true;
          styles = {
            "alias" = "fg=magenta,bold";
            "command" = "fg=cyan";
          };
        };
        shellAliases = {
          dotnix = "cd ~/.DotNix";
          flakebuild = "sudo nixos-rebuild switch --flake .";
        };
      };
      git = {
        enable = true;
        userName = "Shiina";
        userEmail = "shiina.shy@gibhug.com";
      };
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
      btop = {
        enable = true;
        settings = {
          color_theme = "TTY";
          theme_background = false;
        };
      };
    };

    # Set Config Files:
    home.file.".config/alacritty/alacritty.toml".source = ../configs/alacritty/alacritty.toml;
    home.file.".config/GIMP/3.0" = {
      # Hacky but works :3c
      source =  ../configs/GIMP;
      recursive = true;
    };
    home.file.".config/waybar" = {
      source =  ../configs/waybar;
      recursive = true;
    };
    home.file.".config/rofi/config.rasi".source = ../configs/rofi/config.rasi;
    home.file.".config/mako/config".source = ../configs/mako/config;

    home.file.".config/zed/keymap.json".source = ../configs/zed/keymap.json;
    home.file.".config/zed/settings.json".source = ../configs/zed/settings.json;

    # The state version is required and should stay at the version you originally installed.
    home.stateVersion = "23.11";
  };
}
