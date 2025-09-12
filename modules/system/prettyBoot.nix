{
  config.flake.nixosModules.prettyBoot = _: {
    boot = {
      plymouth = {
        enable = true;
        theme = "bgrt";
      };

      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "loglevel=3"
        "rd.systemd.show_status=auto"
      ];
    };
  };
}
