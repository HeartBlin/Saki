{ config, inputs, lib, pkgs, ... }:

let ctx = config.aster;
in {
  users.users = lib.genAttrs ctx.users (userName: {
    packages =
      [ inputs.vicinae.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  });
}
