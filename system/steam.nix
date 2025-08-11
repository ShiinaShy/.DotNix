# Steam stuff
{ config, pkgs, ...}:
{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  # programs.gamemode.enable = true; # Breaks kde-connect

  environment.systemPackages = with pkgs; [
    mangohud
  ];
}
