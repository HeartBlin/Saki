{ pkgs, modules, ... }:

let
  usedModules = with modules.nixosModules; [ nh nvidiaSuperbia steam ];
in{
  imports = usedModules;

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

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.package = pkgs.nixVersions.nix_2_30;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
  nixpkgs.hostPlatform = "x86_64-linux";
}

