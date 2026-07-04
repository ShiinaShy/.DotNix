# Module to blur an image
{ pkgs, wallpaper }:

pkgs.stdenv.mkDerivation {
  name = "blur";

  img = wallpaper;
  nativeBuildInputs = [
    pkgs.imagemagick
  ];

  dontUnpack = true;

  installPhase = ''
    magick $img -blur 0x30 out.png
    mv out.png $out
  '';
}
