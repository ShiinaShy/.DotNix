# ███╗░░██╗██╗██╗░░██╗░░░░░░░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░
# ████╗░██║██║╚██╗██╔╝░░░░░░██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░
# ██╔██╗██║██║░╚███╔╝░█████╗██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░
# ██║╚████║██║░██╔██╗░╚════╝██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗
# ██║░╚███║██║██╔╝╚██╗░░░░░░╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝
# ╚═╝░░╚══╝╚═╝╚═╝░░╚═╝░░░░░░░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../system/hyprland.nix
      ../system/utils.nix
      ../system/programms.nix
      ../system/environment.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable NTFS Support
  boot.supportedFilesystems = ["ntfs"];

  # Powermanagement
  # set amd_pstate=passive and uncomment cpuFreqGovenor for maxium batterylife
  boot.kernelParams = [ "amd_pstate=active" ];
  powerManagement.enable = true;
  # powerManagement.cpuFreqGovernor = "powersave";
  services.power-profiles-daemon.enable=true; # used by waybar to set powerprofile | breaks with cpuFreqGovenor

  networking.hostName = "deskbottom"; # Hostname
  # networking.wireless.enable = true;  # Wireless support via wpa_supplicant

  # Enable networking
  networking.networkmanager.enable = true;

  # Set time zone
  time.timeZone = "Europe/Berlin";

  # Internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shiina = {
    isNormalUser = true;
    description = "shiina";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [];
  };
  programs.zsh.enable = true; # wiki told me to o.o

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    #programms in ./system :3
  ];

  # System Fonts
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.fira-code
    nerd-fonts.profont
    #(nerdfonts.override { fonts = [ "FiraCode" "ProFont" ]; })
  ];

   # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable Flakes
  nix.settings.experimental-features  = ["nix-command" "flakes"];
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
