{ modules, ... }:

{
  users.users.heartblin = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" ];
    initialPassword = "changeme";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.heartblin = { ... }: {
      imports = with modules.homeModules; [ git vscode ];

      programs.home-manager.enable = true;

      home.username = "heartblin";
      home.homeDirectory = "/home/heartblin";
      home.stateVersion = "25.11";
    };
  };
}
