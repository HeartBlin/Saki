{
  flake.nixosModules.discord = { currentUser, pkgs, ... }: {
    users.users."${currentUser}".packages = [
      (pkgs.discord.override {
        withOpenASAR = true;
        withVencord = true;
        withTTS = true;
      })
    ];
  };
}
