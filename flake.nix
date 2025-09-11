{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    systems.url = "github:nix-systems/default-linux";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    import-tree.url = "github:vic/import-tree";

    disko.url = "github:nix-community/disko";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ flake-parts, nixpkgs, home-manager, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } ({ config, ... }: {
      systems = import inputs.systems;

      imports = [
        home-manager.flakeModules.home-manager
        (inputs.import-tree ./modules)
      ];

      flake.meta.name = "Saki";

      flake.nixosConfigurations = {
        Superbia = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { modules = config.flake; };

          modules = [
            ./machines/Superbia/configuration.nix
            ./machines/Superbia/hardware-configuration.nix
            ./machines/Superbia/disko.nix
            ./users/heartblin/home.nix

            inputs.disko.nixosModules.disko
            inputs.home-manager.nixosModules.home-manager
          ];
        };
      };
    });
}
