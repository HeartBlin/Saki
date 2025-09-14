{
  flake.nixosModules.asus = { config, lib, ... }: {
    services = {
      supergfxd.enable = true;
      asusd = {
        enable = true;
        enableUserService = true;
      };
    };
  };
}
