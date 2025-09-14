{
  flake.nixosModules.gamemode = _: {
    programs.gamemode = {
      enable = true;
      enableRenice = true;
    };
  };
}
