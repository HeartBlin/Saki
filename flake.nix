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
    vicinae.url = "github:vicinaehq/vicinae?ref=v0.16.10";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, self, ... }@inputs:
    let
      inherit (nixpkgs.lib) genAttrs nixosSystem;
      inherit (builtins) readDir pathExists attrNames filter;
      systems = [ "x86_64-linux" ];
      hosts = filter (name: pathExists ./hosts/${name}/config.nix)
        (attrNames (readDir ./hosts));
    in {
      nixosConfigurations = genAttrs hosts (hostName:
        nixosSystem {
          specialArgs = { inherit inputs self; };
          modules =
            [ ./hosts/${hostName}/config.nix ./hosts/${hostName}/disko.nix ];
        });

      devShells = genAttrs systems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shells { inherit pkgs system; });

      formatter = genAttrs systems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in pkgs.nixfmt-classic);
    };
}
