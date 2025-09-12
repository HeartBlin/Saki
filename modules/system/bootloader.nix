{
  config.flake.nixosModules.bootloader = { ... }: {
    services.journald.extraConfig = "SystemMaxUse=50M";
    boot = {
      initrd.systemd.enable = true;
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        timeout = 0;
      };
    };
  };
}
