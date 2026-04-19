{
  deskbottom = {
    monitor = ''
      output "DP-1" {
          mode "3440x1440@144"
          //variable-refresh-rate
          position x=-3440 y=-160
      }
      output "DP-2" {
          mode "1920x1080@60"
          position x=0 y=0
      }
    '';
    autoStart = "waybar & hyprpaper & sleep 1 && discord & keepassxc & kdeconnect-indicator";
  };
  lapbottom = {
    monitor = ''
      output = "eDP-1" {
          mode "2256x1504@60"
      }
    '';
    autoStart = "waybar & hyprpaper & sleep 1 && keepassxc & kdeconnect-indicator";
  };
}
