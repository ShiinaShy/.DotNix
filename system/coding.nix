# Tools needed for Programming :3
{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    zig
    zls
    nixd
  ];
}
