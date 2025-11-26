{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "bibata-cursor";

  src = pkgs.fetchurl {
    url = "https://github.com/rtgiskard/bibata_cursor/releases/download/v1.0.0/Bibata-Modern-Classic.hypr.tar.zst";
    sha256 = "sha256-t/T9LZ1DGvqyad924xwrZuDJnoi8+Jvu6X0dE0hFsPE=";
  };
  nativeBuildInputs = [ pkgs.zstd ];

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    tar --zstd -xvf $src --strip-components=1 -C $out/ 
  '';
}
