{ inputs, modulesPath, self, ... }:

{
  imports = [
    # From flake inputs
    inputs.hjem.nixosModules.default
    inputs.disko.nixosModules.default

    # From this flake
    (modulesPath + "/installer/scan/not-detected.nix")

    "${self}/modules/system/boot.nix"
    "${self}/modules/system/network.nix"
    "${self}/modules/system/nix.nix"
    "${self}/modules/system/users.nix"

    "${self}/modules/apps/analysis.nix"
    "${self}/modules/apps/chrome.nix"
    "${self}/modules/apps/davinci.nix"
    "${self}/modules/apps/dev.nix"
    "${self}/modules/apps/discord.nix"
    "${self}/modules/apps/foot.nix"
    "${self}/modules/apps/shell.nix"
    "${self}/modules/apps/vicinae.nix"
    "${self}/modules/apps/vmware.nix"

    "${self}/modules/desktop/gnome-utils.nix"
    "${self}/modules/desktop/hypr/hyprland.nix"
    "${self}/modules/desktop/hypr/hyprpaper.nix"
    "${self}/modules/desktop/hypr/hyprtheming.nix"
    "${self}/modules/desktop/sddm.nix"

    "${self}/modules/hardware/asus.nix"
    "${self}/modules/hardware/nvidia.nix"
  ];

  aster.users = [ "heartblin" ];

  networking.hostName = "Vega";
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.11";
}
