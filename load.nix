# Simply imports all the files
# maybe some smart stuff in the future
{ config, pkgs, ...}:
{
  imports = [
    #./user/home.nix
    ./system/hyprland.nix
    ./system/utils.nix
    ./system/programms.nix
    ./system/environment.nix
  ];
}
