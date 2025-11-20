{
  flake.nixosModules.hyprlandMeta = { currentUser, inputs', ... }: {
    users.users.${currentUser}.packages = [ inputs'.ags.packages.agsFull ];
  };
}
