{ modules, ... }:

let usedModules = with modules.homeModules; [ chrome git vscode ];
in {
  users.users.heartblin = {
    description = "HeartBlin";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" ];
    initialPassword = "changeme";
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
