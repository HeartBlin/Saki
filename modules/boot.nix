{
  config.flake.nixosModules.boot = _: {
    system.nixos.distroName = "Saki";
    services.journald.extraConfig = "SystemMaxUse=50M";
    boot = {
      initrd.systemd.enable = true;
      loader = {
        timeout = 0;
        efi.canTouchEfiVariables = true;
        systemd-boot = {
          enable = true;
          editor = false;
        };
      };

      tmp.useTmpfs = true;
    };

    zramSwap = {
      enable = true;
      memoryPercent = 50;
    };
  };
}
