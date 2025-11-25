{ config, inputs, lib, pkgs, ... }:

let ctx = config.networking;
in {
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  config = lib.mkMerge [
    # Default
    {
      boot = {
        tmp.useTmpfs = true;
        initrd.systemd.enable = true;
        loader = {
          timeout = 0;
          efi.canTouchEfiVariables = true;
          systemd-boot = {
            enable = true;
            editor = false;
          };
        };

        # SPLIT: Custom kernel per host
        kernelPackages = {
          Vega = pkgs.linuxPackages_zen;
        }.${ctx.hostName} or pkgs.linuxPackages_lts;
      };
    }

    # SPLIT: SecureBoot per host
    (lib.mkIf (ctx.hostName == "Vega") {
      environment.systemPackages = [ pkgs.sbctl ];

      boot = {
        bootspec.enable = true;
        loader.systemd-boot.enable = lib.mkForce false;
        lanzaboote = {
          enable = true;
          pkiBundle = "/var/lib/sbctl";
        };
      };
    })

    # SPLIT: Quiet Boot per host
    (lib.mkIf (ctx.hostName == "Vega") {
      boot = {
        consoleLogLevel = 3;
        initrd.verbose = false;
        plymouth = {
          enable = true;
          theme = "bgrt";
        };

        kernelParams = [
          "quiet"
          "splash"
          "boot.shell_on_fail"
          "udev.log_priority=3"
          "loglevel=3"
          "rd.systemd.show_status=auto"
        ];
      };
    })
  ];
}
