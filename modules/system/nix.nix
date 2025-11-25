{ config, inputs, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nixVersions.nix_2_31;
    channel.enable = false;

    registry = lib.mapAttrs (_: v: { flake = v; })
      (lib.filterAttrs (_: x: lib.isType "flake" x) inputs);

    nixPath = lib.mapAttrsToList (x: _: "${x}=flake:${x}") config.nix.registry;

    settings = {
      accept-flake-config = lib.mkForce false;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = [ "nix-command" "flakes" ];
      keep-derivations = true;
      keep-outputs = true;
      trusted-users = [ "root" "@wheel" ];
      warn-dirty = false;
    };
  };

  documentation = {
    nixos.enable = false;
    man.enable = false;
    info.enable = false;
  };
}
