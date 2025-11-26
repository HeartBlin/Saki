{ config, lib, pkgs, ... }:

let ctx = config.aster;
in {
  hjem.users = lib.genAttrs ctx.users (_: {
    files.".config/hypr/hyprpaper.conf".text = ''
      splash = false

      preload = ~/Pictures/Wallpapers/Balatro_background.png
      wallpaper = eDP-1, ~/Pictures/Wallpapers/Balatro_background.png
    '';
  });

  users.users =
    lib.genAttrs ctx.users (_: { packages = with pkgs; [ hyprpaper ]; });
}
