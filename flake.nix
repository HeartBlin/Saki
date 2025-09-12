{
  inputs = {
    # Core
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";

    # Utilities
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    import-tree.url = "github:vic/import-tree";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";

    # System management
    disko.url = "github:nix-community/disko";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ flake-parts, nixpkgs, home-manager, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } ({ config, self, ... }: {
      systems = import inputs.systems;

      imports = [
        home-manager.flakeModules.home-manager
        (inputs.import-tree ./modules)
        ./fragments/checks.nix
      ];

      flake.nixosConfigurations =
        (import ./machines/definitions.nix { inherit config inputs self; });
    });
}
