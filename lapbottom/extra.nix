# Extra settings only required for lapbottom
{...}:

{
  # Powermanagement
  boot.kernelParams = [ "amd_pstate=active" ];
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;
  services.power-profiles-daemon.enable=true; # for waybar
  systemd.sleep.extraConfig = "HibernateDelaySec=120m"; # uspend-then-hibernate delay

  # Enable firmware updates
  services.fwupd.enable = true;

  # Disable instant system kill when pressing power button o.o
  services.logind.settings.Login = {
    HandlePowerKey = "ignore";
    HandlePowerKeyLongPress = "reboot";
    HandleLidSwitch = "suspend-then-hibernate";
  };

  # Fingerprint
  services.fprintd.enable = true;
}
