# Extra settings only required for deskbottom
{...}:

{
  # Powermanagement
  boot.kernelParams = [ "amd_pstate=active" ];
  powerManagement.enable = true;
  services.power-profiles-daemon.enable=true; # for waybar

  # Enable NTFS Support
  boot.supportedFilesystems = ["ntfs"];
}

