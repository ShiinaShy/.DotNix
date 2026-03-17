# Configs for tty and related programms
{ colors, ...}:
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
          girl = "man";
          winboot = "systemctl reboot --boot-loader-entry=auto-windows";
        };
      };
      alacritty = {
        enable = true;
        settings = {
          window.padding = { x = 10; y = 5; };
          # general.import = ["~/.cache/wal/colors-alacritty.toml"];
          window.opacity = 0.8;
          terminal.shell.program = "zsh";
          font.normal.family = "Profont IIx Nerd Font Mono"; 
          colors = {
            primary = {
              foreground = colors.foreground;
              background = colors.background;
            };
            bright = {
              black = colors.color0;
              red = colors.color9;
              green = colors.color10;
              yellow = colors.color11;
              blue = colors.color12;
              magenta = colors.color13;
              cyan = colors.color14;
              white = colors.color15;
            };
            normal = {
              black = colors.color8;
              red = colors.color9;
              green = colors.color10;
              yellow = colors.color11;
              blue = colors.color12;
              magenta = colors.color13;
              cyan = colors.color14;
              white = colors.color15;
            };
          };
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
