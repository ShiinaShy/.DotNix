{config, pkgs, inputs, ...}:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ./theme.nix
  ];


  home-manager.users.shiina = { config, pkgs, ... }: {
    home.packages = [];
    programs = {
      bash.enable = true;
      git = {
        enable = true;
        userName = "Shiina";
        userEmail = "shiina.shy04@gmail.com";
      };
    };

    # Librewolf
    programs.librewolf = {
      enable = true;
      settings = {
        "general.autoScroll" = true;
        "browser.toolbars.bookmarks.visibility" = "newtab";
        "browser.compactmode.show" = true;
      };
    };

    # Set Config Files:
    home.file.".config/hypr/hyprpaper.conf".source = ../configs/hypr/hyprpaper.conf;
    home.file.".config/hypr/hyprland.conf".source = ../configs/hypr/hyprland.conf;
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

    home.file.".icons/McMojave" = {
      # copy of McMojave stored in .DotNix | could've used flake but didn't like it due to unnececary complexity
      # not happy either but maybe can find better solution in future :3
      source = ../configs/hypr/McMojave;
      recursive = true;
    };
    # The state version is required and should stay at the version you originally installed.
    home.stateVersion = "23.11";
  };
}
