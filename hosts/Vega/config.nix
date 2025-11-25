{ inputs, modulesPath, self, ... }:

{
  imports = [
    # From flake inputs
    inputs.hjem.nixosModules.default
    inputs.disko.nixosModules.default

    # From this flake
    (modulesPath + "/installer/scan/not-detected.nix")
    "${self}/modules/users.nix"
    "${self}/modules/boot.nix"
  ];

  ctxSaki.users = [ "heartblin" ];

  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.11";
}
