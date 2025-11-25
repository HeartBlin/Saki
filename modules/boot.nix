{ pkgs, ... }:

{
  boot = {
    tmp.useTmpfs = true;
    initrd.systemd.enable = true;
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      timeout = 0;
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        editor = false;
      };
    };
  };
}
