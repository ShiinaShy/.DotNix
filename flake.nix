# I don't really know what i am doing here...
{
  description = "A very gay flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      varsConfig = import ./vars.nix;
    in {
      nixosConfigurations = {
        deskbottom = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            vars = varsConfig.deskbottom;
          };
          modules = [
            ./deskbottom/configuration.nix
            ./user/home.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      lapbottom = nixpkgs.lib.nixosSystem {
	system= "x86_64-linux";
	specialArgs = {
	  inherit inputs;
	  vars = varsConfig.lapbottom;
	};
	modules = [
	  ./lapbottom/configuration.nix
	  inputs.nixos-hardware.nixosModules.framework-13-7040-amd
	  ./user/home.nix
      inputs.home-manager.nixosModules.default
	];
      };
    };
  };
}
