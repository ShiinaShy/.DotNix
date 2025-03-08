# Different tools and utilities :3
{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    lsof
    grim
    slurp
    vulkan-tools
    wget
    git
    neofetch
    rsclock
    gotop
    lm_sensors
    killall
  ];
}
