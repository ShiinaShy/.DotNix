{ colors, ... }:
{
  home-manager.users.shiina = {...}: {
    home.file.".config/Kvantum/pywal/pywal.json".text = ''
      {{
          "name": "pywal",
          "variables": {{
              "accent_color": "${colors.color14}",
              "accent_bg_color": "${colors.color14}",
              "accent_fg_color": "${colors.color0p70}",
              "destructive_color": "${colors.foreground}",
              "destructive_bg_color": "${colors.color14}",
              "destructive_fg_color": "${colors.backgroundp70}",
              "success_color": "${colors.background}",
              "success_bg_color": "${colors.color3}",
              "success_fg_color": "${colors.foreground}",
              "warning_color": "${colors.foreground}",
              "warning_bg_color": "#ff0000",
              "warning_fg_color": "${colors.background}",
              "error_color": "${colors.foreground}",
              "error_bg_color": "#ff0000",
              "error_fg_color": "${colors.background}",
              "window_bg_color": "${colors.background}",
              "window_fg_color": "${colors.color14}",
              "view_bg_color": "${colors.background}",
              "view_fg_color": "${colors.foreground}",
              "headerbar_bg_color": "${colors.background}",
              "headerbar_fg_color": "${colors.foreground}",
              "headerbar_border_color": "${colors.backgroundp03}",
              "headerbar_backdrop_color": "${colors.color14}",
              "headerbar_shade_color": "${colors.color11}",
              "card_bg_color": "${colors.color14}",
              "card_fg_color": "${colors.color0}",
              "card_shade_color": "${colors.color11}",
              "dialog_bg_color": "${colors.color3}",
              "dialog_fg_color": "${colors.foreground}",
              "popover_bg_color": "${colors.color3}",
              "popover_fg_color": "${colors.color14}",
              "shade_color": "${colors.color8}",
              "scrollbar_outline_color": "${colors.color12}",
              "sidebar_bg_color": "${colors.color4}",
              "sidebar_fg_color": "${colors.color14}",
              "sidebar_backdrop_color": "${colors.color2}",
              "sidebar_shade_color": "${colors.color5}"
          }},
          "palette": {{
              "blue_": {{
                  "1": "#99c1f1",
                  "2": "#62a0ea",
                  "3": "#3584e4",
                  "4": "#1c71d8",
                  "5": "#1a5fb4"
              }},
              "green_": {{
                  "1": "#8ff0a4",
                  "2": "#57e389",
                  "3": "#33d17a",
                  "4": "#2ec27e",
                  "5": "#26a269"
              }},
              "yellow_": {{
                  "1": "#f9f06b",
                  "2": "#f8e45c",
                  "3": "#f6d32d",
                  "4": "#f5c211",
                  "5": "#e5a50a"
              }},
              "orange_": {{
                  "1": "#ffbe6f",
                  "2": "#ffa348",
                  "3": "#ff7800",
                  "4": "#e66100",
                  "5": "#c64600"
              }},
              "red_": {{
                  "1": "#f66151",
                  "2": "#ed333b",
                  "3": "#e01b24",
                  "4": "#c01c28",
                  "5": "#a51d2d"
              }},
              "purple_": {{
                  "1": "#dc8add",
                  "2": "#c061cb",
                  "3": "#9141ac",
                  "4": "#813d9c",
                  "5": "#613583"
              }},
              "brown_": {{
                  "1": "#cdab8f",
                  "2": "#b5835a",
                  "3": "#986a44",
                  "4": "#865e3c",
                  "5": "#63452c"
              }},
              "light_": {{
                  "1": "#ffffff",
                  "2": "#f6f5f4",
                  "3": "#deddda",
                  "4": "#c0bfbc",
                  "5": "#9a9996"
              }},
              "dark_": {{
                  "1": "#77767b",
                  "2": "#5e5c64",
                  "3": "#3d3846",
                  "4": "#241f31",
                  "5": "#000000"
              }}
          }},
          "custom_css": {{
              "gtk4": "",
              "gtk3": ""
          }},
          "plugins": {{}}
      }}
    '';
  };
}
