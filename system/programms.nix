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
    nheko
    kdePackages.qt6ct #needed for nheko themeing
    (pkgs.discord.override { withOpenASAR = true;})
  ];
  nixpkgs.config.permittedInsecurePackages = [ "olm-3.2.16" ];
}
