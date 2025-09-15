{ modules, ... }:

{
  networking.hostName = "Superbia";
  system.stateVersion = "25.11";
  imports = with modules.nixosModules; [
    asus
    boot
    chaotic
    chrome
    discord
    fish
    gamemode
    git
    mangohud
    nh
    nix
    nvidia
    starship
    prettyBoot
    steam
    user
    vscode
  ];

  networking.networkmanager.enable = true;
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
}

