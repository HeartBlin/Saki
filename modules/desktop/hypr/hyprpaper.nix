{ config, lib, pkgs, ... }:

let ctx = config.aster;
in {
  hjem.users = lib.genAttrs ctx.users (userName: {
    files.".config/hypr/hyprpaper.conf".text = ''
      splash = false

      preload = ~/Pictures/Wallpapers/Balatro_background.png
      wallpaper = eDP-1, ~/Pictures/Wallpapers/Balatro_background.png
    '';
  });

  users.users =
    lib.genAttrs ctx.users (userName: { packages = with pkgs; [ hyprpaper ]; });
}
