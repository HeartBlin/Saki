{
  flake.nixosModules.hyprland = { currentUser, inputs', ... }: {
    users.users.${currentUser}.packages = [ inputs'.vicinae.packages.default ];
  };
}
