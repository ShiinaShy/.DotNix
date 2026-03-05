{pkgs, vars, ...}:
let
  mcMojave = import ./mc-mojave-cursor.nix { inherit pkgs; };
  bibata = import ./bibata-cursor.nix { inherit pkgs; };

  # Device specific variables
  monitor = vars.monitor;
  autoStart = vars.autoStart;
  workspaceRules = vars.workspaceRules;
  blur = vars.blur;
  shadow = vars.shadow;
  vfr = vars.vfr;
  suspendType = vars.suspendType;

  cursorTheme = "bibata";
  mainMod = "mod";
  terminal = "alacritty";
  fileManager = "nemo";
  browser = "librewolf";
  menu = "\"rofi\" \"-show\" \"drun\"";
in {
  home-manager.users.shiina = {...}: {
    home.file.".config/niri/config.kdl".text = ''
      input {
          keyboard {
              xkb {
                  layout "eu"
              }
          }
          touchpad {
              tap
              natural-scroll
          }
          mouse {
              accel-speed 0.5
              accel-profile "flat"
          }
          warp-mouse-to-focus
          focus-follows-mouse max-scroll-amount="0%"
      }

      output "DP-1" {
          mode "3440x1440@144"
          //variable-refresh-rate
          position x=-3440 y=-160
      }
      output "DP-2" {
          mode "1920x1080@60"
          position x=0 y=0
      }

      cursor {
          xcursor-theme "Bibata-Modern-Classic" 
          xcursor-size 24
      }

      spawn-at-startup "waybar"
      spawn-at-startup "discord"
      spawn-at-startup "hyprpaper"
      spawn-at-startup "keepassxc"
      spawn-at-startup "kdeconnect-indicator"

      binds {
          ${mainMod}+Shift+Slash { show-hotkey-overlay; }

          // Applications
          ${mainMod}+Q {spawn "${terminal}";}
          ${mainMod}+C {close-window;}
          ${mainMod}+E {spawn "${fileManager}";}
          ${mainMod}+F {spawn "${browser}";}
          ${mainMod}+R {spawn ${menu};}

          // Volume
          XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
          XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
          XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
          XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }

          // Media
          XF86AudioPlay        allow-when-locked=true { spawn-sh "playerctl play-pause"; }
          XF86AudioStop        allow-when-locked=true { spawn-sh "playerctl stop"; }
          XF86AudioPrev        allow-when-locked=true { spawn-sh "playerctl previous"; }
          XF86AudioNext        allow-when-locked=true { spawn-sh "playerctl next"; }

          // Brightness
          XF86MonBrightnessUp allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "+10%"; }
          XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "10%-"; }

          // Window controls
          ${mainMod}+Left  { focus-column-left; }
          ${mainMod}+Down  { focus-window-down; }
          ${mainMod}+Up    { focus-window-up; }
          ${mainMod}+Right { focus-column-right; }
          ${mainMod}+H     { focus-column-left; }
          ${mainMod}+J     { focus-window-down; }
          ${mainMod}+K     { focus-window-up; }
          ${mainMod}+L     { focus-column-right; }

          ${mainMod}+Shift+Left  { move-column-left; }
          ${mainMod}+Shift+Down  { move-window-down; }
          ${mainMod}+Shift+Up    { move-window-up; }
          ${mainMod}+Shift+Right { move-column-right; }
          ${mainMod}+Shift+H     { move-column-left; }
          ${mainMod}+Shift+J     { move-window-down; }
          ${mainMod}+Shift+K     { move-window-up; }
          ${mainMod}+Shift+L     { move-column-right; }

          // Workspace controls
          ${mainMod}+S { focus-workspace-previous; }
          ${mainMod}+Tab { toggle-overview; }

          ${mainMod}+1 { focus-workspace 1; }
          ${mainMod}+2 { focus-workspace 2; }
          ${mainMod}+3 { focus-workspace 3; }
          ${mainMod}+4 { focus-workspace 4; }
          ${mainMod}+5 { focus-workspace 5; }
          ${mainMod}+6 { focus-workspace 6; }
          ${mainMod}+7 { focus-workspace 7; }
          ${mainMod}+8 { focus-workspace 8; }
          ${mainMod}+9 { focus-workspace 9; }
          ${mainMod}+Shift+1 { move-column-to-workspace 1; }
          ${mainMod}+Shift+2 { move-column-to-workspace 2; }
          ${mainMod}+Shift+3 { move-column-to-workspace 3; }
          ${mainMod}+Shift+4 { move-column-to-workspace 4; }
          ${mainMod}+Shift+5 { move-column-to-workspace 5; }
          ${mainMod}+Shift+6 { move-column-to-workspace 6; }
          ${mainMod}+Shift+7 { move-column-to-workspace 7; }
          ${mainMod}+Shift+8 { move-column-to-workspace 8; }
          ${mainMod}+Shift+9 { move-column-to-workspace 9; }

          ${mainMod}+BracketLeft  { consume-or-expel-window-left; }
          ${mainMod}+BracketRight { consume-or-expel-window-right; }

          ${mainMod}+W { switch-preset-column-width; }
          ${mainMod}+Shift+W { switch-preset-window-height; }
          ${mainMod}+Ctrl+W { expand-column-to-available-width; }
          ${mainMod}+Z { maximize-column; }
          ${mainMod}+Shift+Z { fullscreen-window; }

          ${mainMod}+V       { toggle-window-floating; }
          ${mainMod}+Shift+V { switch-focus-between-floating-and-tiling; }

          Print { screenshot; }
          Ctrl+Print { screenshot-screen; }
          Alt+Print { screenshot-window; }
          // Print { spawn "grimblast" "--freeze" "copy" "area"; }

          ${mainMod}+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }

          // The quit action will show a confirmation dialog to avoid accidental exits.
          ${mainMod}+M { quit; }

          ${mainMod}+Shift+P { power-off-monitors; }
      }

      gestures {
          dnd-edge-view-scroll {
              trigger-width 30
              delay-ms 100
              max-speed 1500
          }

          dnd-edge-workspace-switch {
              trigger-height 50
              delay-ms 100
              max-speed 1500
          }

          hot-corners {
              off
              // top-left
              // top-right
              // bottom-left
              // bottom-right
          }
      }

      include "/home/shiina/.cache/wal/colors-niri.kdl"

      layout {
          gaps 10 

          center-focused-column "never"
          background-color "transparent"

          preset-column-widths {
              proportion 0.33333
              proportion 0.5
              proportion 0.66667
          }

          default-column-width { proportion 0.5; }

          focus-ring {
              off
          }
          border {
              width 2
              urgent-color "#9b0000"
          }

          // You can enable drop shadows for windows.
          shadow {
              // Uncomment the next line to enable shadows.
              on

              // By default, the shadow draws only around its window, and not behind it.
              // Uncomment this setting to make the shadow draw behind its window.
              //
              // Note that niri has no way of knowing about the CSD window corner
              // radius. It has to assume that windows have square corners, leading to
              // shadow artifacts inside the CSD rounded corners. This setting fixes
              // those artifacts.
              //
              // However, instead you may want to set prefer-no-csd and/or
              // geometry-corner-radius. Then, niri will know the corner radius and
              // draw the shadow correctly, without having to draw it behind the
              // window. These will also remove client-side shadows if the window
              // draws any.
              //
              // draw-behind-window true

              // You can change how shadows look. The values below are in logical
              // pixels and match the CSS box-shadow properties.

              // Softness controls the shadow blur radius.
              softness 30

              // Spread expands the shadow.
              spread 5

              // Offset moves the shadow relative to the window.
              offset x=0 y=5

              // You can also change the shadow color and opacity.
              color "#0007"
          }

          struts {
              left 5 
              right 5 
              top 0
              bottom 5 
          }
      }

      hotkey-overlay {
          skip-at-startup
      }

      prefer-no-csd

      screenshot-path null

      animations {
          // off
      }

      window-rule {
          draw-border-with-background false
          geometry-corner-radius 10
          clip-to-geometry true
      }

      window-rule {
          match app-id=r#"^org\.keepassxc\.KeePassXC$"#
          match app-id=r#"^org\.gnome\.World\.Secrets$"#

          block-out-from "screen-capture"

          // Use this instead if you want them visible on third-party screenshot tools.
          // block-out-from "screencast"
      }

      layer-rule {
          match namespace="^hyprpaper$"
          place-within-backdrop true
      }

      // Open the Firefox picture-in-picture player as floating by default.
      window-rule {
          // This app-id regular expression will work for both:
          // - host Firefox (app-id is "firefox")
          // - Flatpak Firefox (app-id is "org.mozilla.firefox")
          match app-id=r#"firefox$"# title="^Picture-in-Picture$"
          open-floating true
      }
      window-rule {
          match title="KeePassXC - Browser Access Request" 
          match title="Unlock Database - KeePassXC"
          open-floating true
      }
    '';
  };
}
