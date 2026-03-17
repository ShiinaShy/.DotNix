{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "pywal colors";

  src = builtins.readFile ./pywal-colors.nix;
  wallpaper = ../wallpaper/fox.png;
  nativeBuildInputs = [ pkgs.pywal16 ];

  dontUnpack = true;

  preBuild = ''
    export HOME=$(mktemp -d)
  '';

  installPhase = ''
    mkdir $HOME/.config
    export XDG_CONFIG_HOME=$HOME/.config
    mkdir $XDG_CONFIG_HOME/wal
    mkdir $XDG_CONFIG_HOME/wal/templates
    echo $src > $HOME/.config/wal/templates/cols.nix
    mkdir garbage
    wal -i $wallpaper --cols16 --out-dir garbage
    mv garbage/cols.nix $out
  '';
}
