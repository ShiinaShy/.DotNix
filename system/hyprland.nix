# All programms needed to create a "Desktop Enviroment"
{ config, pkgs, inputs, ...}:
{
  # Enable ddcci kernel Module (had to disable because i have the ONE FUCKING MONITOR THAT BREAKS?! qwq https://github.com/rockowitz/ddcutil/issues/153)
  #boot.extraModulePackages = [config.boot.kernelPackages.ddcci-driver];
  #boot.kernelModules = ["i2c-dev" "ddcci_backlight"];

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
