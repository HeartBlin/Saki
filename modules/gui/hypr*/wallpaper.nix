{
  flake.nixosModules.hyprland = { currentUser, inputs', ... }: {
    users.users.${currentUser}.packages =
      [ inputs'.hyprpaper.packages.default ];

    hjem.users."${currentUser}".files.".config/hypr/hyprpaper.conf".text = ''
      splash = false

      preload = ~/Pictures/Wallpapers/Balatro_background.png
      wallpaper = eDP-1, ~/Pictures/Wallpapers/Balatro_background.png
    '';
  };
}
