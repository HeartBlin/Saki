{ inputs, modulesPath, lib, pkgs, self, ... }:

let inherit (lib) mkForce;
in {
  imports = [
    # From flake inputs
    inputs.hjem.nixosModules.default
    inputs.disko.nixosModules.default
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.nix-index-database.nixosModules.nix-index

    # Unknown hardware
    (modulesPath + "/installer/scan/not-detected.nix")

    # From 'system'
    "${self}/modules/system/audio.nix"
    "${self}/modules/system/boot.nix"
    "${self}/modules/system/locale.nix"
    "${self}/modules/system/network.nix"
    "${self}/modules/system/nix.nix"
    "${self}/modules/system/quietBoot.nix"
    "${self}/modules/system/secureBoot.nix"
    "${self}/modules/system/users.nix"

    # From 'apps'
    "${self}/modules/apps/analysis.nix"
    "${self}/modules/apps/android.nix"
    "${self}/modules/apps/chrome.nix"
    "${self}/modules/apps/davinci.nix"
    "${self}/modules/apps/dev.nix"
    "${self}/modules/apps/discord.nix"
    "${self}/modules/apps/foot.nix"
    "${self}/modules/apps/gaming.nix"
    "${self}/modules/apps/shell.nix"
    "${self}/modules/apps/vicinae.nix"
    "${self}/modules/apps/vmware.nix"

    # From 'desktop'
    "${self}/modules/desktop/gnome-utils.nix"
    "${self}/modules/desktop/hypr/hyprland.nix"
    "${self}/modules/desktop/hypr/hyprpaper.nix"
    "${self}/modules/desktop/hypr/hyprtheming.nix"
    "${self}/modules/desktop/sddm.nix"

    # From 'hardware'
    "${self}/modules/hardware/asus.nix"
    "${self}/modules/hardware/nvidia.nix"
  ];

  # Users
  aster.users = [ "heartblin" ];

  # Module overrides
  boot.kernelPackages = mkForce pkgs.linuxPackages_zen;

  # Identity
  networking.hostName = "Vega";
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.11";
}
