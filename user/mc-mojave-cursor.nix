{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "mc-mojave-cursor";

  src = pkgs.fetchurl {
    url = "https://github.com/Libadoxon/mcmojave-hyprcursor/releases/download/v0.1/McMojave.tar.gz";
    sha256 = "0acj3ya8lcm54jsgjsibw51bfsr6x2nfr2apw1abgydvvfa9n404";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    tar -xvzf $src --strip-components=1 -C $out/
  '';
}
