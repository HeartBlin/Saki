{
  flake.nixosModules.steam = { currentUser, pkgs, ... }: {
    users.users."${currentUser}".packages = [ pkgs.protontricks ];
    programs.steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
  };
}
