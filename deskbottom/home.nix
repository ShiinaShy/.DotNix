{ inputs, ...}:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ../user/home.nix
  ];

  home-manager.users.shiina = { ... }: {
    home.stateVersion = "25.11";
  };
}
