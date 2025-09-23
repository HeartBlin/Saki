{
  flake.nixosModules.user = { currentUser, inputs, pkgs, prettyName, ... }: {
    hjem = {
      clobberByDefault = true;
      linker = inputs.smfh.packages.${pkgs.system}.smfh;
      users."${currentUser}" = {
        enable = true;
        directory = "/home/${currentUser}";
        user = "${currentUser}";
      };
    };

    users.users.${currentUser} = {
      description = prettyName;
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" "input" ];
      initialPassword = "changeme";
    };
  };
}
