{
  flake.nixosModules.boot = _: {
    system.nixos.distroName = "Saki";
    services = {
      fwupd.enable = true;
      journald.extraConfig = "SystemMaxUse=50M";
    };

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
    };

    zramSwap = {
      enable = true;
      memoryPercent = 50;
    };
  };
}
