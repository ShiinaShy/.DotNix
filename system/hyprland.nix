# All programms needed to create a "Desktop Enviroment"
{ config, pkgs, ...}:
{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  # Electron use Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    glib #maybe some day i find out why past me added it here :3c
    waybar
    pywal
    hyprpaper
    rofi-wayland
    xdg-desktop-portal-gtk
    xviewer
    nemo
  ];
}
