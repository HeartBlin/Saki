{ currentUser, modules, pkgs, ... }:

let
  usedModules = with modules.nixosModules; [
    boot
    chrome
    fish
    gamemode
    git
    mangohud
    nh
    nix
    nvidiaSuperbia
    starship
    prettyBoot
    steam
    vscode
  ];
in {
  imports = usedModules;

  networking.hostName = "Superbia";
  networking.networkmanager.enable = true;

  users.users.heartblin = {
    description = "HeartBlin";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" ];
    initialPassword = "changeme";
  };

  hjem = {
    linker = pkgs.smfh;
    users."${currentUser}" = {
      enable = true;
      directory = "/home/${currentUser}";
      user = "${currentUser}";
    };
  };

  time.timeZone = "Europe/Bucharest";

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "25.11";
  nixpkgs.hostPlatform = "x86_64-linux";
}

