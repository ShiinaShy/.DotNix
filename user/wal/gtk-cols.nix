{...}:
{
  home-manager.users.shiina = {...}: {
    home.file.".config/wal/gtk-cols.css".text = ''
      @define-color window_bg_color {background};
      @define-color window_fg_color {color14};
      @define-color view_bg_color {background};
      @define-color view_fg_color {foreground};
      @define-color accent_bg_color {color11};
      @define-color accent_fg_color {color14};
      @define-color accent_color {color14};
      @define-color headerbar_bg_color {background};
      @define-color headerbar_fg_color {foreground};
      @define-color headerbar_backdrop_color {background};
      @define-color headerbar_shade_color {color11};
      @define-color card_bg_color {color14};
      @define-color card_fg_color {color0};
      @define-color card_shade_color {color11};
      @define-color popover_bg_color rgba(0, 0, 0, 0.7);
      @define-color popover_fg_color {color14};
      @define-color dialog_bg_color {color3};
      @define-color dialog_fg_color {foreground};
      @define-color sidebar_bg_color {color4};
      @define-color sidebar_fg_color {color14};
      @define-color sidebar_backdrop_color {color2};
      @define-color sidebar_shade_color {color5};

      @define-color warning_bg_color #ff0000;
      @define-color warning_fg_color {background};
      @define-color warning_color {foreground};
      @define-color error_bg_color #ff0000;
      @define-color error_fg_color {background};
      @define-color error_color {foreground};
      @define-color success_bg_color {color3};
      @define-color success_fg_color {foreground};
      @define-color suecess_color {background};
      @define-color destructive_bg_color {color14};
      @define-color destructive_fg_color {background};
      @define-color destructive_color {foreground};
    '';
  };
}
