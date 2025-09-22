# Programms needed for Programming in ZIG :3
{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    zig
    zls
    nixd
    #zed-editor
    # (zed-editor.fhsWithPackages (pkgs: [ pkgs.zlib ]))
  ];
}
