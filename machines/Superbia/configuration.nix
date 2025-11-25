{ modules, ... }:

{
  system.stateVersion = "25.11";
  imports = with modules.nixosModules; [
    analysis
    asus
    boot
    chrome
    davinci
    discord
    fish
    gamemode
    git
    gnome
    hyprlandMeta
    mangohud
    minecraft
    networking
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

