{config, pkgs, inputs, ...}:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ./theme.nix
    ./hyprland.nix
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

    # home.file.".icons/McMojave1" = {
    #   # copy of McMojave stored in .DotNix | could've used flake but didn't like it due to unnececary complexity
    #   # not happy either but maybe can find better solution in future :3
    #   source = ../configs/hypr/McMojave;
    #   recursive = true;
    # };
    # The state version is required and should stay at the version you originally installed.
    home.stateVersion = "23.11";
  };
}
