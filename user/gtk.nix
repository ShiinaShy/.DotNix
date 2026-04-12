# GTK Config
{ pkgs, colors, ...}:
{
  home-manager.users.shiina = {...}:
    let
      adw-color = ''
        @define-color window_bg_color ${colors.background};
        @define-color window_fg_color ${colors.color14};
        @define-color view_bg_color ${colors.background};
        @define-color view_fg_color ${colors.foreground};
        @define-color accent_bg_color ${colors.color11};
        @define-color accent_fg_color ${colors.color14};
        @define-color accent_color ${colors.color14};
        @define-color headerbar_bg_color ${colors.background};
        @define-color headerbar_fg_color ${colors.foreground};
        @define-color headerbar_backdrop_color ${colors.background};
        @define-color headerbar_shade_color ${colors.color11};
        @define-color card_bg_color ${colors.color14};
        @define-color card_fg_color ${colors.color0};
        @define-color card_shade_color ${colors.color11};
        @define-color popover_bg_color rgba(0, 0, 0, 0.7);
        @define-color popover_fg_color ${colors.color14};
        @define-color dialog_bg_color ${colors.color3};
        @define-color dialog_fg_color ${colors.foreground};
        @define-color sidebar_bg_color ${colors.color4};
        @define-color sidebar_fg_color ${colors.color14};
        @define-color sidebar_backdrop_color ${colors.color2};
        @define-color sidebar_shade_color ${colors.color5};

        @define-color warning_bg_color #ff0000;
        @define-color warning_fg_color ${colors.background};
        @define-color warning_color ${colors.foreground};
        @define-color error_bg_color #ff0000;
        @define-color error_fg_color ${colors.background};
        @define-color error_color ${colors.foreground};
        @define-color success_bg_color ${colors.color3};
        @define-color success_fg_color ${colors.foreground};
        @define-color suecess_color ${colors.background};
        @define-color destructive_bg_color ${colors.color14};
        @define-color destructive_fg_color ${colors.background};
        @define-color destructive_color ${colors.foreground};
      '';
    in
    {
      home.packages = with pkgs; [ 
        libsForQt5.qtstyleplugin-kvantum
        libsForQt5.qt5ct
        qt6Packages.qt6ct
        qt6Packages.qtstyleplugin-kvantum
      ];

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
        gtk4.extraCss = adw-color;
      };
    };
}
