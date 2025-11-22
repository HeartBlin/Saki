{
  flake.nixosModules.davinci = { currentUser, pkgs, ... }: {
    users.users."${currentUser}".packages = with pkgs; [ davinci-resolve ];
  };
}
