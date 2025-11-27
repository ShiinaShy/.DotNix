{...}:
{
  home-manager.users.shiina = {...}: {
    home.file.".config/wal/templates/pywal.json".source = ./pywal.json;
    home.file.".config/wal/templates/pywal.kvconfig".source = ./pywal.kvconfig;
    home.file.".config/wal/templates/hyprland-cols.svg".source = ./pywal.svg;
  };
}
