{ inputs, ...}:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ../user/home.nix
  ];

  home-manager.users.shiina = { ... }: {
    home.stateVersion = "26.05";
  };
}
