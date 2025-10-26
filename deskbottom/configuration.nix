# Default config for Deskbottom
{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./extra.nix
      ../system/hyprland.nix
      ../system/utils.nix
      ../system/programms.nix
      ../system/environment.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "deskbottom";
  networking.networkmanager.enable = true;

  # Time zone
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

  # Set user account (set password with ‘passwd’ or AAAAAAAAAAa)
  users.users.shiina = {
    isNormalUser = true;
    description = "shiina";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
  };

  # System specific packages
  environment.systemPackages = with pkgs; [
    # nothing :3
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features  = ["nix-command" "flakes"];
  # Store state version (no touchy!)
  system.stateVersion = "23.11"; 
}
