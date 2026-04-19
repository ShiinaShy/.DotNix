# Niri configuration
{ pkgs, ...}:
{
  security.polkit.enable = true;

  programs = {
    niri = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    bibata-cursors
    xwayland-satellite
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    hyprpaper
    hyprlock
  ];
}
