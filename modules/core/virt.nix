{
  flake.nixosModules.virt = { currentUser, pkgs, ... }: {
    virtualisation.vmware.host = {
      enable = true;
      extraConfig = ''
        mks.gl.allowUnsupportedDrivers = "TRUE"
        mks.vk.allowUnsupportedDrivers = "TRUE"
      '';
    };
  };
}
