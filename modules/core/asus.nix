{
  flake.nixosModules.asus = _: {
    services = {
      supergfxd.enable = true;
      asusd = {
        enable = true;
        enableUserService = true;
      };
    };
  };
}
