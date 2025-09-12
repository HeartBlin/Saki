{ modules, pkgs, ... }:

let
  usedModules = with modules.homeModules; [
    chrome
    fish
    git
    mangohud
    starship
    vscode
  ];
in {
  programs.fish.enable = true;
  users.users.heartblin = {
    description = "HeartBlin";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" ];
    initialPassword = "changeme";
    shell = pkgs.fish;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.heartblin = { ... }: {
      imports = usedModules;
      programs.home-manager.enable = true;
      home = {
        username = "heartblin";
        homeDirectory = "/home/heartblin";
        stateVersion = "25.11";
      };
    };
  };
}
