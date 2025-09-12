{ config, inputs, self, ... }:

let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (config) flake;

  machineFiles = machine: let
    files = [ "configuration.nix" "hardware-configuration.nix" "disko.nix" ];
  in map (file: "${self}/machines/${machine}/${file}") files;

  userFiles = user: let
    files = [ "home.nix" ];
  in map (file: "${self}/users/${user}/${file}") files;
in {
  # ROG Strix G513IE Laptop
  # - CPU: AMD Ryzen 7 4800H
  # - GPU: NVIDIA GeForce RTX 3050 Ti Mobile
  # - RAM: 16GB
  # - Storage: 1TB Samsung SSD 970 EVO Plus NVMe
  Superbia = nixosSystem {
    system = "x86_64-linux";
    specialArgs = { modules = flake; };

    modules = [
      inputs.disko.nixosModules.disko
      inputs.home-manager.nixosModules.home-manager
    ] ++ machineFiles "Superbia" ++ userFiles "heartblin";
  };
}
