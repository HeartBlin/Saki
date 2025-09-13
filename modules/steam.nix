{
  config.flake.nixosModules.steam = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.protontricks ];
    programs.steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
  };
}
