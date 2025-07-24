# Different tools and utilities :3
{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    lsof
    grimblast
    vulkan-tools
    wget
    git
    rsclock
    fastfetch
    hyfetch
    lm_sensors
    btop
  ];
}
