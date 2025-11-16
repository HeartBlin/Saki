{
  flake.nixosModules.hyprland = { pkgs, ... }: {
    programs.dconf.profiles.user.databases = [{
      settings."org/gnome/desktop/interface" = {
        gtk-theme = "Adwaita-dark";
        icon-theme = "Adwaita";
        cursor-theme = "Bibata-Modern-Ice";
      };
    }];

    environment.systemPackages = with pkgs; [
      bibata-cursors
      gnome-themes-extra
    ];
  };
}
