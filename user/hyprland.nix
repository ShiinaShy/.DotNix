{config, pkgs, inputs, vars, ...}:
let
  monitor = vars.monitor;
in {
  home.file.".config/text/text.txt".text = monitor;
}
