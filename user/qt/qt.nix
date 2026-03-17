# This is a modified Version of eylles pywal-libadwaita theme licenced under GPL-3.0
# You can find it here: https://github.com/eylles/pywal16-libadwaita
{...}:
{
  imports = [
    ./kvconfig.nix
    ./svg.nix
    ./json.nix
  ];
  home-manager.users.shiina = { ... }:
  {
    qt = {
      enable = true;
      platformTheme.name = "qt5ct";
      style.name = "kvantum";
    };

    home.file.".config/Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=pywal     
    '';
    home.file.".config/kdeglobals".text =
    ''
      [UiSettings]
      ColorScheme=*
      [General]
      TerminalApplication=alacritty
      TerminalService=Alacritty.desktop
    '';
  };
}
