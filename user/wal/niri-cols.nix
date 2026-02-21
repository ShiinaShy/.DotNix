{...}:
{
  home-manager.users.shiina = {...}: {
    home.file.".config/wal/templates/niri-cols.kdl".text = ''
      layout {
          border {
              active-gradient from="{color14}" to="#{color12}" angle=45 relative-to="workspace-view" in="oklch longer hue"
              inactive-color "#{color1}"
          }
      }
    '';
  };
}

        
