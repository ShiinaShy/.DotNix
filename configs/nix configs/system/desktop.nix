{ config, pkgs, ...}:
{
environment.systemPackages = with pkgs; [
    glib
    waybar
    swww
    pywal
    rofi-wayland

    cinnamon.xviewer
    cinnamon.nemo
];
}
