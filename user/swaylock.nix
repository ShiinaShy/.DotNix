{ ... }:
{
  home-manager.users.shiina = {...}: {
    home.file.".config/swaylock/config".text = ''
      show-failed-attempts
      image=~/.config/blur.png
      scaling=fill
      font=ProFontIIxNerdFontMono
    '';
  };
}
