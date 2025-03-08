# Simply imports all the files
# maybe some smart stuff in the future
{ config, pkgs, ...}:
{
  imports = [
    #./user/home.nix
    ./user/system/hyprland.nix
    ./user/system/utils.nix
    ./user/system/programms.nix
    ./user/system/environment.nix
  ];
}
