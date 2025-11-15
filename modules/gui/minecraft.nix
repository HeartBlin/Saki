{
  flake.nixosModules.minecraft = { currentUser, pkgs, ... }: {
    users.users."${currentUser}".packages = with pkgs; [ prismlauncher ];
  };
}
