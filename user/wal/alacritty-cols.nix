{...}:
{
  home-manager.users.shiina = {...}: {
    home.file.".config/wal/templates/colors-alacritty.toml".text = ''
      [colors]
      [colors.primary]
        foreground = "{foreground}"
        background = "{background}"
        #cursor = {{ text = "CellBackground", cursor = "CellForeground" }} I dunno??
      [colors.bright]
        black = "{color0}"
        red = "{color9}"
        green = "{color10}"
        yellow =  "{color11}"
        blue = "{color12}"
        magenta = "{color13}"
        cyan = "{color14}"
        white = "{color15}"
      [colors.normal]
        black = "{color8}"
        red = "{color9}"
        green = "{color10}"
        yellow = "{color11}"
        blue = "{color12}"
        magenta = "{color13}"
        cyan = "{color14}"
        white = "{color15}" 
    '';
  };
}
