# GTK Config
{ config, lib, pkgs, ...}:
{
  home-manager.users.shiina =
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
          # name = "Omni";
          # package = pkgs.omni-gtk-theme;
          name = "adw-gtk3";
          package = pkgs.adw-gtk3;
        };
        gtk3.extraCss = adw-color;
      };
      qt = {
        enable = true;
        platformTheme.name = "gtct";
        style.name = "kvantum";
        # style.package = pkgs.adwaita-qt;
      };
    };
}
