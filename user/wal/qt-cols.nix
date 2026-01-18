# This is a modified Version of eylles pywal-libadwaita theme licenced under GPL-3.0
# You can find it here: https://github.com/eylles/pywal16-libadwaita
{...}:
{
  home-manager.users.shiina = {...}: {
    home.file.".config/wal/templates/pywal.json".source = ./pywal.json;
    home.file.".config/wal/templates/pywal.kvconfig".source = ./pywal.kvconfig;
    home.file.".config/wal/templates/pywal.svg".source = ./pywal.svg;
  };
}
