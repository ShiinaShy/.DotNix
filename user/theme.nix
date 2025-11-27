# GTK Config
{ pkgs, ...}:
{
  home-manager.users.shiina = {config, ...}:
    let
        adw-color = "@import '/home/shiina/.cache/wal/colors-gtk.css';";
    in
    {
      gtk = {
        enable = true;
        iconTheme = {
          name = "Papirus";
          package = pkgs.papirus-icon-theme;
        };
        theme = {
          name = "adw-gtk3";
          package = pkgs.adw-gtk3;
        };
        gtk3.extraCss = adw-color;
      };
      qt = {
        enable = true;
        platformTheme.name = "qt5ct";
        style.name = "kvantum";
      };
      # for qt6 ColorSchemes
      home.file.".config/kdeglobals".text =
      ''
        [UiSettings]
        ColorScheme=*
      '';

      # Link pywal generated kvantum theme into kvantum directory
      home.file.".config/Kvantum/pywal/pywal.kvconfig".source = config.lib.file.mkOutOfStoreSymlink "/home/shiina/.cache/wal/pywal.kvconfig";
      home.file.".config/Kvantum/pywal/pywal.svg".source = config.lib.file.mkOutOfStoreSymlink "/home/shiina/.cache/wal/pywal.svg";
      home.file.".config/Kvantum/pywal/pywal.json".source = config.lib.file.mkOutOfStoreSymlink "/home/shiina/.cache/wal/pywal.json";
      home.file.".config/Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=pywal     
      '';
    };
}
