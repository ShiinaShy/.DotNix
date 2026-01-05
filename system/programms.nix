# Main Programms used :3
{ pkgs, ...}:
{
  # Enable KDEConnect
  programs.kdeconnect.enable = true;

  # Enable gnome-keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.sshAgentAuth.enable = true;
  # Set ssh config
  programs.ssh.extraConfig = ''
    Host github.com
    IdentityFile ~/.ssh/github
    Host gitlab.kit.edu
    IdentityFile ~/.ssh/KITlab
  '';
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
