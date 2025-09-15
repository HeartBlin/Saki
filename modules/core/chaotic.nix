{
  flake.nixosModules.chaotic = { inputs, lib, pkgs, ... }: {
    imports = [ inputs.chaotic.nixosModules.default ];

    boot.kernelPackages = pkgs.linuxPackages_cachyos-gcc;
    programs.steam.extraCompatPackages = with pkgs;
      lib.mkForce [ proton-cachyos_x86_64_v2 proton-ge-custom ];
  };
}
