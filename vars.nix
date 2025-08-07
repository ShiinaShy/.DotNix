{
  deskbottom = {
    monitor = ''
      monitor=DP-2,3440x1440@144,auto,1,vrr,2
      monitor=DP-3,1920x1080@60,auto-left,1
    '';
    autoStart = "waybar & hyprpaper & discord & keepassxc & kdeconnect-indicator";
    workspaceRules = "workspace = 5, monitor:DP-3, default:true";
  };
  lapbottom = {
    monitor = ''
      monitor=eDP-1,2256x1504@60,auto,1.333333
    '';
    autoStart = "waybar & hyprpaper & keepassxc & kdeconnect-indicator";
    workspaceRules = "";
  };
}
