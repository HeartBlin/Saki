{
  flake.nixosModules.analysis = { currentUser, pkgs, ... }: {
    users.users."${currentUser}" = {
      packages = with pkgs; [ nmap tcpdump wireshark ];
      extraGroups = [ "wireshark" ];
    };

    programs.wireshark = {
      enable = true;
      dumpcap.enable = true;
      usbmon.enable = true;
    };
  };
}
