{
  flake.nixosModules.gnome = { lib, pkgs, ... }:
    let
      inherit (lib.gvariant) mkInt32;
      extensions = with pkgs.gnomeExtensions; [
        appindicator
        blur-my-shell
        disable-workspace-switcher-overlay
        extension-list
      ];
    in {
      environment.systemPackages = extensions;
      services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
        gnome.core-apps.enable = true;
        udev.packages = [ pkgs.gnome-settings-daemon ];
      };

      programs.dconf.profiles.user.databases = [{
        lockAll = true;
        settings = {
          "org/gnome/desktop/interface" = {
            accent-color = "blue";
            color-scheme = "prefer-dark";
          };

          "org/gnome/shell".enabled-extensions =
            (map (ext: ext.extensionUuid) extensions);

          # Blur My Shell
          "org/gnome/shell/extensions/blur-my-shell" = {
            brightness = 0.85;
            dash-opacity = 0.25;
            sigma = mkInt32 15;
            static-blur = true;
          };

          # Static Workspaces
          "org/gnome/mutter".dynamic-workspaces = false;
          "org/gnome/desktop/wm/preferences".num-workspaces = mkInt32 5;

          # Workspace binds
          "org/gnome/desktop/wm/keybindings" = {
            switch-to-workspace-1 = [ "<Super>1" ];
            switch-to-workspace-2 = [ "<Super>2" ];
            switch-to-workspace-3 = [ "<Super>3" ];
            switch-to-workspace-4 = [ "<Super>4" ];
            switch-to-workspace-5 = [ "<Super>5" ];
            move-to-workspace-1 = [ "<Super><Shift>1" ];
            move-to-workspace-2 = [ "<Super><Shift>2" ];
            move-to-workspace-3 = [ "<Super><Shift>3" ];
            move-to-workspace-4 = [ "<Super><Shift>4" ];
            move-to-workspace-5 = [ "<Super><Shift>5" ];
          };

          # Disable app shortcuts
          "org/gnome/shell/keybindings" = {
            switch-to-application-1 = [ "<Super><Control>1" ];
            switch-to-application-2 = [ "<Super><Control>2" ];
            switch-to-application-3 = [ "<Super><Control>3" ];
            switch-to-application-4 = [ "<Super><Control>4" ];
            switch-to-application-5 = [ "<Super><Control>5" ];
          };
        };
      }];
    };
}
