{...}:
let
  fontSize = "15px";
  borderRad = "10px";
  paddingLR = "7px";
  padding = "0px ${paddingLR}";
  marginT = "7px";
  marginB = "3px";
  margin = "${marginT} 0px ${marginB} 0px";
  alpha = "0.9";
in {
  home-manager.users.shiina = {...}: {
    home.file.".config/waybar/style.css".text = ''
      /* Import PyWal Colors */
      @import '../../.cache/wal/colors-waybar.css';

      @define-color lightcol @color14;
      @define-color darkcol @color11;
      @define-color backcol alpha(@background, ${alpha});
      @define-color hovercol alpha(@color3, 0.3);


      /* General */
      * {
          font-family: Profont IIx Nerd Font, monospace;
          font-size: ${fontSize};
      }

      window#waybar {
          all:unset;
          /* background-color: green; */
      }

      tooltip {
          background: rgba(0,0,0,0.7);
          color: @lightcol;
          border-radius: 10px;
          border: none;
      }
      tooltip * {
          color: @lightcol;
      }

      menu {
          background: rgba(0,0,0,0.7);
          color: @lightcol;
          border-radius: 10px;
      }
      menuitem:hover {
          background: @hovercol;
      }

      /* Modules Left */
      #custom-appmenu {
          background: @backcol;
          box-shadow: 0px 0px 2px @backcol;
          color: @lightcol;
          margin: ${marginT} 15px ${marginB} 15px;
          padding: ${paddingLR} 10px ${paddingLR} 10px;
          border-radius: ${borderRad};
          transition: all 0.3s ease-in-out;
      }
      #custom-appmenu:hover {
          background: @hovercol;
          color: @lightcol;
      }

      #taskbar {
          background: @backcol;
          box-shadow: 0px 0px 2px @backcol;
          margin: ${marginT} 15px ${marginB} 15px;
          padding: 0px 5px;
          border-radius: ${borderRad};
      }
      #taskbar button {
          margin:0;
          border-radius: 15px;
          padding: 0px 7px 0px 7px;
      }

      #window {
          background: @backcol;
          box-shadow: 0px 0px 2px @backcol;
          color:@lightcol;
          margin: ${margin};
          padding: ${padding};
          border-radius: ${borderRad};
      }
      window#waybar.empty #window {
          background-color:transparent;
          box-shadow: 0px 0px 0px transparent;
      }

      /* Modules Center */
      #workspaces {
          background: @backcol;
          box-shadow: 0px 0px 2px @backcol;
          margin: ${margin};
          padding: ${padding};
          border-radius: ${borderRad};
      }
      #workspaces button {
          font-size: 20px;
          padding: 0px 5px;
          color: alpha(@darkcol, .3);
          text-shadow: 0px 0px 2px alpha(@darkcol, .3);
          transition: all .2s ease;
      }
      #workspaces button.active {
          color: alpha(@lightcol, .8);
          text-shadow: 0px 0px 3px alpha(@lightcol, .8);
          transition: all 1s ease;
      }
      #workspaces button:hover {
          background: transparent;
          color: alpha(@lightcol, .8);
          text-shadow: 0px 0px 3px alpha(@lightcol, .8);
      }

      /* Modules Right */
      #audio {
          background: @backcol;
          box-shadow: 0px 0px 2px @backcol;
          margin: ${marginT} 15px ${marginB} 15px;
          padding: 7px 0px 7px 0px;
          border-radius: ${borderRad};
          transition: all 0.3s ease-in-out;
      }
      #pulseaudio {
          color: @lightcol;
          margin: 0px 10px;
      }

      #status {
          background: @backcol;
          box-shadow: 0px 0px 2px @backcol;
          color: @lightcol;
          margin: 7px 15px 3px 15px; /* 3px is top and botton spacing of the container 15px is for the sides*/
          padding: 7px 10px 7px 10px; /* 7px left and right of text */
          border-radius: 10px;
          transition: all 0.3s ease-in-out;
      }
      #power-profiles-daemon {
          margin: 0px 8px 0px 5px;
      }
      #battery {
          margin: 0px 5px;
      }
      #network {
          margin: 0px 5px;
      }

      @keyframes blink {
          to {
              color: white;
          }
      }
      #battery.critical:not(.charging) {
          color: red;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }
      #clock {
          margin: 0px 5px 0px 15px;
      }
      #custom-power {
          margin: 0px 5px;
      }
    '';
  };
}
