{ config, inputs, lib, pkgs, ... }:

let ctx = config.aster;
in {
  options.aster.users = lib.mkOption {
    description = "List of users to enable on a host";
    type = lib.types.listOf lib.types.str;
    default = [ ];
  };

  config = lib.mkIf (ctx.users != [ ]) {
    users.users = lib.genAttrs ctx.users (userName: {
      isNormalUser = true;
      home = "/home/${userName}";
      extraGroups = [ "wheel" "networkmanager" ];
    });

    hjem = {
      clobberByDefault = true;
      linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
      users = lib.genAttrs ctx.users (userName: {
        enable = true;
        directory = "/home/${userName}";
        user = userName;
      });
    };
  };
}
