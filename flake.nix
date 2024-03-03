{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    bionix.url = "github:PapenfussLab/bionix";
    # neve.url = "github:redyf/Neve";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs system;};
          modules = [ 
            ./devices/laptop/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
      };
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs system;};
          modules = [ 
            ./devices/desktop/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
      };
      nixosConfigurations.server = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs system;};
          modules = [ 
            ./devices/server/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
      };
    };
}
