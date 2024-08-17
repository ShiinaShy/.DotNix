{xconfig, pkgs, ...}:
{
  imports = [ 
    <home-manager/nixos> 
    /home/shiina/DotHome/gtk.nix
  ];


  home-manager.users.shiina = { pkgs, ... }: {
    home.packages = [];
    programs.bash.enable = true;

    # GTK Config
    #gtk = {
     # enable = true;
      #iconTheme = {
       # name = "Papirus";
        #package = pkgs.papirus-icon-theme;
      #};
      #theme = {
      #  name = "Omni";
       # package = pkgs.omni-gtk-theme;
      #};
    #};

   # Librewolf
   programs.librewolf = {
     enable = true;
     settings = {
       "general.autoScroll" = true;
       "browser.toolbars.bookmarks.visibility" = "newtab";
     };
   };

    # Set Config Files:
    # home.file.".config/test/test.file".source = /home/shiina/dotfiles/test/test;
    # The state version is required and should stay at the version you originally installed.
    home.stateVersion = "23.11";
  };
}
