{
  flake.nixosModules.hyprland = { currentUser, inputs', self', ... }: {
    users.users.${currentUser}.packages = [ inputs'.ags.packages.agsFull ];
  };
}
