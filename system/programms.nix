# Main Programms used :3
{ pkgs, ...}:
{
  # Enable KDEConnect
  programs.kdeconnect.enable = true;
  # Enable gnome-keyring
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    librewolf
    alacritty
    gimp3
    keepassxc
    nheko
    kdePackages.qt6ct #needed for nheko themeing
    (pkgs.discord.override { withOpenASAR = true;})
    thunderbird
    protonmail-bridge-gui
  ];
  nixpkgs.config.permittedInsecurePackages = [ "olm-3.2.16" ];
}
