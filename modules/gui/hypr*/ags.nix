{
  flake.nixosModules.hyprland = { currentUser, inputs', ... }: {
    users.users.${currentUser}.packages = [ inputs'.ags.packages.agsFull ];
  };
}
