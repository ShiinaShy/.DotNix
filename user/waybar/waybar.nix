{...}:
{
  imports = [
    ./style.nix
    ./powerMenu.nix
  ];

  home-manager.users.shiina = {...}: {
    home.file.".config/waybar/config".text = ''
      {
      // General
      "layer": "top",
      "margin-left": 0,
      "margin-right": 0,
      "spacing": 0,

      // Load Modules
      "include": ["~/.config/waybar/modules.json"],

      // Modules Left
      "modules-left": [
        "custom/appmenu",
        "wlr/taskbar",
        "hyprland/window",
        "niri/window"
      ],

      // Modules Center
      "modules-center": [
        "hyprland/workspaces",
        "niri/workspaces"
      ],
      // Modules Right
      "modules-right": [
        // Audio
        "group/audio",

        // System Tray
        "tray",

        // System Status
        "group/status"
      ]
    }
    '';
    home.file.".config/waybar/modules.json".source = ./modules.json;
  };
}
