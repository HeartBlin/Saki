{
  description = "Aster - NixOS configuration flake";
  inputs = {
    # Core
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # System management
    hjem.url = "github:feel-co/hjem";
    disko.url = "github:nix-community/disko";

    # Input tax
    lanzaboote.url = "github:nix-community/lanzaboote";
    vicinae.url = "github:vicinaehq/vicinae";
  };

  outputs = { nixpkgs, self, ... }@inputs:
    let
      lib = nixpkgs.lib;
      hosts =
        builtins.filter (name: builtins.pathExists ./hosts/${name}/config.nix)
        (builtins.attrNames (builtins.readDir ./hosts));
    in {
      nixosConfigurations = lib.genAttrs hosts (hostName:
        lib.nixosSystem {
          specialArgs = { inherit inputs self; };
          modules =
            [ ./hosts/${hostName}/config.nix ./hosts/${hostName}/disko.nix ];
        });
    };
}
