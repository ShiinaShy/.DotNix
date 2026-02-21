# All programms needed to create a "Desktop Enviroment"
{ pkgs, ...}:
{
  # Enable Hyprland
  programs = {
    niri = {
      enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];
}
