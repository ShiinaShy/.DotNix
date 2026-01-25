# Extra settings only required for deskbottom
{...}:

{
  # Powermanagement
  boot.kernelParams = [ "amd_pstate=active" ];
  powerManagement.enable = true;
  services.power-profiles-daemon.enable=true; # for waybar

  # Enable NTFS Support
  boot.supportedFilesystems = ["ntfs"];

  networking.nameservers = [
    "185.246.188.51"
    "37.156.68.20"
    "2a06:1700:3:11::1"
    "2a06:1700:100:20::1"
  ];
}

