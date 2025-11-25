{
  flake.nixosModules.nix = { config, inputs, pkgs, lib, ... }: {
    nixpkgs.config.allowUnfree = true;
    nix = {
      package = pkgs.nixVersions.nix_2_31;
      channel.enable = false;

      registry = lib.mapAttrs (_: v: { flake = v; })
        (lib.filterAttrs (_: x: lib.isType "flake" x) inputs);

      nixPath =
        lib.mapAttrsToList (x: _: "${x}=flake:${x}") config.nix.registry;

      settings = {
        accept-flake-config = lib.mkForce false;
        auto-optimise-store = true;
        builders-use-substitutes = true;
        experimental-features = [ "nix-command" "flakes" ];
        keep-derivations = true;
        keep-outputs = true;
        trusted-users = [ "root" "@wheel" ];
        warn-dirty = false;

        substituters = [
          "https://cache.nixos.org?priority=10"
          "https://nix-community.cachix.org"
          "https://hyprland.cachix.org"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        ];
      };
    };

    documentation = {
      nixos.enable = false;
      man.enable = false;
      info.enable = false;
    };
  };
}
