{ config, inputs, lib, pkgs, ... }:

let ctx = config.aster;
in {
  users.users = lib.genAttrs ctx.users (_: {
    packages =
      [ inputs.vicinae.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  });
}
