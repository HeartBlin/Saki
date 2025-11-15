{ config, inputs, self, withSystem, ... }:

let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (config) flake;

  machineFiles = machine:
    let
      files = [ "configuration.nix" "hardware-configuration.nix" "disko.nix" ];
    in map (file: "${self}/machines/${machine}/${file}") files;
in {
  systems = [ "x86_64-linux" ];

  flake.nixosConfigurations = {
    # ROG Strix G513IE Laptop
    # - CPU: AMD Ryzen 7 4800H
    # - GPU: NVIDIA GeForce RTX 3050 Ti Mobile
    # - RAM: 16GB
    # - Storage: 1TB Samsung SSD 970 EVO Plus NVMe
    Superbia = let
      currentUser = "heartblin";
      prettyName = "HeartBlin";
    in withSystem "x86_64-linux" ({ inputs', ... }:
      nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          modules = flake;
          inherit currentUser inputs inputs' prettyName;
        };

        modules =
          [ inputs.disko.nixosModules.disko inputs.hjem.nixosModules.hjem ]
          ++ machineFiles "Superbia";
      });
  };
}
