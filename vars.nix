{
  deskbottom = {
    monitor = ''
      monitor=DP-1,3440x1440@144,auto-left,1,vrr,1
      monitor=DP-2,1920x1080@60,auto-right,1
    '';
    autoStart = "waybar & hyprpaper & discord & keepassxc & kdeconnect-indicator";
    workspaceRules = "workspace = 5, monitor:DP-3, default:true";
    blur = "true";
    shadow = "true";
    vfr = "false";
    suspendType = "suspend";
  };
  lapbottom = {
    monitor = ''
      monitor=eDP-1,2256x1504@60,auto,1.333333
    '';
    autoStart = "waybar & hyprpaper & keepassxc & kdeconnect-indicator";
    workspaceRules = "";
    blur = "true";
    shadow = "false";
    vfr = "true";
    suspendType = "suspend-then-hibernate";
  };
}
