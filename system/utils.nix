# Different tools and utilities :3
{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    lsof
    grim
    slurp
    vulkan-tools
    wget
    git
    rsclock
    fastfetch
    lm_sensors
    btop
    killall
  ];
}
