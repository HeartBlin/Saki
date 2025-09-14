{
  flake.nixosModules.user = { currentUser, inputs, pkgs, prettyName, ... }: {
    hjem.linker = inputs.smfh.packages.${pkgs.system}.smfh;
    users.users.${currentUser} = {
      description = prettyName;
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" "input" ];
      initialPassword = "changeme";
    };
  };
}
