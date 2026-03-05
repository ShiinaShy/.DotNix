# All programms needed to create a "Desktop Enviroment"
{ pkgs, ...}:
{
  security.polkit.enable = true;
  # Enable Hyprland
  programs = {
    niri = {
      enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    bibata-cursors
    xwayland-satellite
    xdg-desktop-portal-gnome
  ];
}
