{
  flake.nixosModules.virt = { currentUser, pkgs, ... }: {
    virtualisation = {
      spiceUSBRedirection.enable = true;
      libvirtd = {
        enable = true;
        qemu.swtpm.enable = true;
      };
    };

    users = {
      groups.libvirtd.members = [ "${currentUser}" ];
      groups.kvm.members = [ "${currentUser}" ];
    };

    environment.systemPackages = with pkgs; [ gnome-boxes dnsmasq phodav ];
  };
}
