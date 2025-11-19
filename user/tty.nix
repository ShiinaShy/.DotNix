# Configs for tty and related programms
{...}:
{
  home-manager.users.shiina = { ... }: {
    programs = {
      bash.enable = true;
      zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        autosuggestion.highlight = "fg=red,italic,underline";
        syntaxHighlighting = {
          enable = true;
          styles = {
            "alias" = "fg=magenta,bold";
            "command" = "fg=cyan";
          };
        };
        shellAliases = {
          dotnix = "cd ~/.DotNix";
          flakebuild = "sudo nixos-rebuild switch --flake .";
          flaketest = "sudo nixos-rebuild test --flake .";
          nnvim = "alacritty -e nvim & disown";
        };
      };
      alacritty = {
        enable = true;
        settings = {
          window.padding = { x = 10; y = 5; };
          general.import = ["~/.cache/wal/alacritty.toml"];
          terminal.shell.program = "zsh";
          font.normal.family = "Profont IIx Nerd Font Mono"; 
          keyboard.bindings = [
            {
              key = "Q";
              mods = "Control";
              action = "ToggleViMode";
            }
          ];
        };
      };
      btop = {
        enable = true;
        settings = {
          color_theme = "TTY";
          theme_background = false;
        };
      };
      git = {
        enable = true;
        settings = {
          user.name = "Shiina";
          user.email = "shiina.shy@gibhug.com";
        };
      };
    };
  };
}
