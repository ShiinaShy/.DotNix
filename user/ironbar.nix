{ colors, ... }:
let
  margin-tb = "0.4em";
  margin-sm = "0.5em";
  radius = "8px";
  trans = "60%";
in
{
  home-manager.users.shiina = {...}: {
    home.file.".config/ironbar/style.css".text = ''
      :root {
          background-color: rgb(from ${colors.background} r g b / 20%);
      }

      * {
          font-family: Profont IIx Nerd Font;
      }

      popover contents {
          border-radius: 8px;
      }

      box, button, label {
          background-color: transparent;
          color: ${colors.color14};
          text-shadow: 1px 1px black;
      }

      .workspaces {
          margin: ${margin-tb} .5em;
      }
      .workspaces .item {
          border-radius: ${radius};
          margin: 0 .2em;
          padding: 0 .4em;
          box-shadow: none;
          background-color: rgb(from ${colors.background} r g b / ${trans});
      }
      .workspaces .item.visible {
          background-color: rgb(from ${colors.color3} r g b / ${trans});
      }

      .launcher {
          border-radius: var(--radius);
          margin: var(--margin-tb) .5em;
          background-color: rgb(from var(--background) r g b / ${trans});
      }
      .launcher .item.focused {
          margin: 0;
          background: transparent;
      }

      .focused {
          border-radius: var(--radius);
          margin: var(--margin-tb) .5em;
          padding: 0 .5em;
          background-color: rgb(from var(--background) r g b / ${trans});

          font-weight: bold;
      }

      #bar #end {
          border-radius: var(--radius);
          margin: var(--margin-tb) .5em;
          background-color: rgb(from var(--background) r g b / ${trans});
      }

      .volume {}
      .volume .sink {
          padding-right: 0.5em;
      }
      .tray {
          margin: 0 0.5em;
      }
      .battery {
          padding: 0;
      }

      .clock {
          font-weight: bold;
      }
      .popup-cltext-box-trimock .calendar {
          background: transparent;
      }
      .popup-clock .calendar-clock {
          font-size: 2.0em;
      }
      .popup-clock .calendar .today {
          background-color: ${colors.color9};
      }

      /* Fix off center glypth from Nerdfont */
      #power-btn {
          padding: 0 .4em 0 .2em;
      }
      .power-profile {
          margin: 0 .5em;
          margin-bottom: .5em;
      }
      /* Fix off center glypths from Nerdfont */
      .power-profile .power-eco {
          padding: 0 .5em 0 .2em;
      }
      .power-profile .power-bal {
          margin: 0 1em;
          padding: 0 .6em 0 .1em;
      }
      .power-profile .power-per {
          padding: 0 .4em 0 .3em;
      }

      scale > trough {
          background-color: rgb(from ${colors.color13} r g b / 20%);
      }

      scale > trough > highlight {
          background-color: purple;
          border-style: dashed;
          border-color: transparent;
          background-color: ${colors.color9};
          border-width: 0.2em;
      }

      scale > trough > slider {
          background-color: ${colors.color14};
      }

      switch > slider {
          background-color: blue;
      }

      switch:checked {
          background-color: magenta;
      }

      switch:not(:checked) {
        background-color: red;
      }

      button {
          padding-left: ${margin-sm};
          padding-top: 0;
          padding-bottom: 0;
          padding-right: ${margin-sm};
      }

      button:hover, button:active, *:selected {
          background-color: rgb(from ${colors.color6} r g b / 50%);
      }
    '';
    home.file.".config/ironbar/config.toml".text = ''
      position = "top"
      height = 40 

      [[start]]
      type = "workspaces"

      [[start]]
      type = "launcher"
      icon_size = 20

      [[center]]
      type = "focused"
      icon_size = 20
      truncate.mode = "middle"
      truncate.max_length = 50

      [[end]]
      type = "volume"
      format = "{icon}"
      mute_format = "{icon}"

      [[end]]
      type = "tray"
      on_click_left = "menu"

      [[end]]
      type = "battery"
      show_label = false
      tooltip = '''{{upower --battery | grep -oP 'percentage:\s+\K\d+%'}} | {{powerprofilesctl get}}'''

      [[end]]
      type = "network_manager"
      types_whitelist = ["ethernet"]

      [[end]]
      type = "clock"
      format = "%H:%M"

      [[end]]
      class = 'power-menu'
      type = 'custom'

      [[end.bar]]
      label = '⏻'
      name = 'power-btn'
      on_click = 'popup:toggle'
      type = 'button'
      [[end.popup]]
      orientation = 'vertical'
      type = 'box'
      [[end.popup.widgets]]
      class = 'power-profile'
      type = 'box'
      [[end.popup.widgets.widgets]]
      class = 'power-eco'
      label = '''<span></span>'''
      on_click = '!powerprofilesctl set power-saver'
      type = 'button'
      [[end.popup.widgets.widgets]]
      class = 'power-bal'
      label = '''<span></span>'''
      on_click = '!powerprofilesctl set balanced'
      type = 'button'
      [[end.popup.widgets.widgets]]
      class = 'power-per'
      label = '''<span></span>'''
      on_click = '!powerprofilesctl set performance'
      type = 'button'
      [[end.popup.widgets]]
      label = '''<span> Poweroff</span>'''
      on_click = '!shutdown now'
      type = 'button'
      [[end.popup.widgets]]
      label = '''<span> Reboot</span>'''
      on_click = '!reboot'
      type = 'button'
      [[end.popup.widgets]]
      label = '''<span>󰒲 Suspend</span>'''
      on_click = '!swaylock & systemctl suspend'
      type = 'button'
      [[end.popup.widgets]]
      label = '''<span> Lock</span>'''
      on_click = '!swaylock'
      type = 'button'
    '';
  };
}
