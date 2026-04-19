# Programms required for desktop enviroment
{ pkgs, ...}:
{
  # Enable ddcci kernel Module (had to disable because i have the ONE monitor that gets bricked qwq https://github.com/rockowitz/ddcutil/issues/153)
  #boot.extraModulePackages = [config.boot.kernelPackages.ddcci-driver];
  #boot.kernelModules = ["i2c-dev" "ddcci_backlight"];

  # required for some file manager features like trash 
  services.gvfs.enable = true;

  # Enable Audio
  security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
  };

  # Make Electron use Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    waybar
    rofi
    mako
    xviewer
    nemo-with-extensions
    kdePackages.dolphin
  ];

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.fira-code
    nerd-fonts.profont
  ];

}
