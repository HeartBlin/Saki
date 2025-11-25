{ config, inputs, lib, pkgs, ... }:

let ctx = config.ctxSaki;
in {
  options.ctxSaki.users = lib.mkOption {
    description = "List of users to enable on a host";
    type = lib.types.listOf lib.types.str;
    default = [ ];
  };

  config = {
    users.users = lib.genAttrs ctx.users (userName: {
      isNormalUser = true;
      home = "/home/${userName}";
      extraGroups = [ "wheel" "networkmanager" ];
      initialPassword = "changeme";
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

    assertions = [{
      assertion = ctx.users != [ ];
      message = "At least one user must be defined in ctxSaki.users";
    }];
  };
}
