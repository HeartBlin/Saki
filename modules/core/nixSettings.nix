{
  flake.nixosModules.nix = { inputs, pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    nix = {
      package = pkgs.nixVersions.latest;
      registry.nixpkgs.flake = inputs.nixpkgs;
      channel.enable = false;

      settings = {
        experimental-features = [ "nix-command" "flakes" ];
        allow-import-from-derivation = false;
        auto-optimise-store = true;
        trusted-users = [ "root" "@wheel" ];
        warn-dirty = false;
      };
    };

    documentation = {
      nixos.enable = false;
      man.enable = false;
      info.enable = false;
    };
  };
}
