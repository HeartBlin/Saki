{
  config.flake.nixosModules.nh = { ... }: {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 3";
      flake = "/Saki";
    };
  };
}
