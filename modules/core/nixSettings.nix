{
  flake.nixosModules.nix = { inputs, pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    nix = {
      package = pkgs.nixVersions.nix_2_31;
      registry.nixpkgs.flake = inputs.nixpkgs;
      channel.enable = false;

      settings = {
        experimental-features = [ "nix-command" "flakes" ];
        allow-import-from-derivation = false;
        auto-optimise-store = true;
        trusted-users = [ "root" "@wheel" ];
        warn-dirty = false;
        trusted-substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [
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
