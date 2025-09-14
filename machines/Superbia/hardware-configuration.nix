{ config, lib, modulesPath, pkgs, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.availableKernelModules =
      [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ "dm-snapshot" ];
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };


  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
