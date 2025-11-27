{...}:
{
  home-manager.users.shiina = {...}: {
    home.file.".config/wal/hyprland-cols.conf".text = ''
      $color0 = rgb({color14.strip})
      $color1 = rgb({color12.strip})
      $color2 = rgb({color1.strip})
    '';
  };
}
