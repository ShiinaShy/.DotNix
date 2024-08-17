# Programms needed for Programming :3
{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    zig
    zed-editor
  ];
}
