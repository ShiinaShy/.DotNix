# Main Programms used :3
{ pkgs, ...}:
{
  # Enable KDEConnect
  programs.kdeconnect = {
    enable = true;
    # package = pkgs.valent; # no indicator
  };

  # Enable gnome-keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.sshAgentAuth.enable = true;

  # Enable zsh
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    librewolf
    alacritty
    gimp3
    keepassxc
    nheko
    (pkgs.discord.override { withOpenASAR = true;})
    thunderbird
    protonmail-bridge-gui
  ];
  nixpkgs.config.permittedInsecurePackages = [ "olm-3.2.16" ];
}
