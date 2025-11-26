{ inputs, lib, pkgs, ... }:

let inherit (lib) mkForce;
in {
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  config = {
    environment.systemPackages = [ pkgs.sbctl ];

    boot = {
      bootspec.enable = true;
      loader.systemd-boot.enable = mkForce false;
      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };
    };
  };
}
