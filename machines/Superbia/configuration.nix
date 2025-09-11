{ config, pkgs, modules, ... }:

{
  imports = with modules.nixosModules; [ steam ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Superbia";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Bucharest";

  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable Chrome
  users.users."heartblin".packages = [ pkgs.google-chrome ];
  environment.etc."opt/chrome/policies/managed/extensions.json".text =
    builtins.toJSON {
      ExtensionInstallForcelist = [
        "ddkjiahejlhfcafbddmgiahcphecmpfh;https://clients2.google.com/service/update2/crx"
        "nngceckbapebfimnlniiiahkandclblb;https://clients2.google.com/service/update2/crx"
        "eimadpbcbfnmbkopoojfekhnkhdbieeh;https://clients2.google.com/service/update2/crx"
      ];
    };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  hardware.graphics = { enable = true; };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = false;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.package = pkgs.nixVersions.nix_2_30;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
  nixpkgs.hostPlatform = "x86_64-linux";
}

