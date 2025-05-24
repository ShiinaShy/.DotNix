# Main Programms used :3
{ pkgs, ...}:
{
  # Fix Nautilus Stuff
  services.gvfs.enable = true;
  # Enable KDEConnect
  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    librewolf
    alacritty
    gimp3
    keepassxc
    (pkgs.discord.override { withOpenASAR = true;})
  ];
}
