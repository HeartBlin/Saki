{
  flake.nixosModules.secureBoot = { inputs, lib, pkgs, ... }: {
    imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

    environment.systemPackages = with pkgs; [ sbctl ];
    boot = {
      bootspec.enable = true;
      loader.systemd-boot.enable = lib.mkForce false;
      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };
    };
  };
}
