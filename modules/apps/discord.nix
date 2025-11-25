{ config, lib, pkgs, ... }:

let ctx = config.aster;
in {
  users.users = lib.genAttrs ctx.users (userName: {
    packages = [
      (pkgs.discord.override {
        withOpenASAR = true;
        withVencord = true;
        withTTS = true;
      })
    ];
  });
}
