{vars, colors, ...}:
let

in {
  home-manager.users.shiina = {...}: {
    home.file.".config/swaylock/config".text = ''
      image=~/.config/wallpaper.png
    '';
  };
}
