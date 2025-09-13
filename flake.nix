{
  inputs = {
    # Core
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko";

    # Utilities
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    import-tree.url = "github:vic/import-tree";

    # System management
    hjem.url = "github:feel-co/hjem";
    hjem.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } ({ config, self, ... }: {
      systems = [ "x86_64-linux" ];
      imports = [ (inputs.import-tree ./modules) (inputs.import-tree ./parts) ];
      flake.nixosConfigurations =
        import ./machines/definitions.nix { inherit config inputs self; };
    });
}
