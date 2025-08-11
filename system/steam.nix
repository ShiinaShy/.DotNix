# Steam stuff
{ config, pkgs, ...}:
{
  programs.steam.enable = true;
  programs.steam.gamescopeSession = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
  ];
}
