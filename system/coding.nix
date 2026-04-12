# Tools needed for Programming :3
{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # ZIG <3 
    zig
    zls
    nixd
    # Typst
    tinymist
    websocat
    typst
  ];
}
