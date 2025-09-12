{ config, inputs, self, ... }:

let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (config) flake;

  machineFiles = machine:
    let
      files = [ "configuration.nix" "hardware-configuration.nix" "disko.nix" ];
    in map (file: "${self}/machines/${machine}/${file}") files;
in {
  # ROG Strix G513IE Laptop
  # - CPU: AMD Ryzen 7 4800H
  # - GPU: NVIDIA GeForce RTX 3050 Ti Mobile
  # - RAM: 16GB
  # - Storage: 1TB Samsung SSD 970 EVO Plus NVMe
  Superbia = let currentUser = "heartblin";
  in nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      modules = flake;
      currentUser = currentUser;
    };

    modules = [
      inputs.disko.nixosModules.disko
      inputs.hjem.nixosModules.hjem
    ] ++ machineFiles "Superbia";
  };
}
