# Tools needed for Programming :3
{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # ZIG <3 
    zig
    zls
    nixd
    # Java qwq
    jetbrains.idea
    jdk21
    # Typst
    tinymist
    websocat
    typst
  ];
}
