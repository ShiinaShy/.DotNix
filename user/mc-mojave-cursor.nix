{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "mc-mojave-cursor";

  src = pkgs.fetchurl {
    url = "https://github.com/Libadoxon/mcmojave-hyprcursor/releases/download/v0.1/McMojave.tar.gz";
    sha256 = "aaaaaaaaaaaaaa";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    tar -xvzf $src -C $out/
  '';
}
