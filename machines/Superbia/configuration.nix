{ modules, ... }:

{
  networking.hostName = "Superbia";
  system.stateVersion = "25.11";
  imports = with modules.nixosModules; [
    asus
    boot
    chrome
    discord
    fish
    gamemode
    git
    gnome
    hyprlandMeta
    mangohud
    minecraft
    nix
    nvidia
    prettyBoot
    secureBoot
    starship
    steam
    user
    virt
    vscode
  ];

  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Bucharest";

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

