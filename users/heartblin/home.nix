{ modules, ... }:

let usedModules = with modules.homeModules; [ chrome git vscode ];
in {
  users.users.heartblin = {
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

      home.username = "heartblin";
      home.homeDirectory = "/home/heartblin";
      home.stateVersion = "25.11";
    };
  };
}
