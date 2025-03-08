# Main Programms used :3
{ config, pkgs, ...}:
{
  #Fix Nautilus Stuff
  services.gvfs.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    librewolf
    alacritty
    (pkgs.discord.override { withOpenASAR = true;})
  ];
}
