{
  flake.nixosModules.hyprlandMeta = { currentUser, inputs', ... }: {
    users.users.${currentUser}.packages = [ inputs'.vicinae.packages.default ];
  };
}
