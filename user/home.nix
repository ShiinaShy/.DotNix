{xconfig, pkgs, inputs, ...}:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ./gtk.nix
  ];


  home-manager.users.shiina = { pkgs, ... }: {
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
      };
    };

    # Set Config Files:
    home.file.".config/hypr/hyprpaper.conf".source = ../configs/hypr/hyprpaper.conf;
    home.file.".config/hypr/hyprland.conf".source = ../configs/hypr/hyprland.conf;
    # The state version is required and should stay at the version you originally installed.
    home.stateVersion = "23.11";
  };
}
