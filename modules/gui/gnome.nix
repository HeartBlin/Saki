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
      environment.systemPackages = extensions ++ [
        pkgs.bibata-cursors
        pkgs.gnome-themes-extra
        pkgs.gnome-tweaks
        pkgs.refine
      ];

      services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
        udev.packages = [ pkgs.gnome-settings-daemon ];
      };

      programs.dconf.profiles.user.databases = [{
        lockAll = true;
        settings = {
          "org/gnome/desktop/interface" = {
            accent-color = "blue";
            color-scheme = "prefer-dark";
            enable-hot-corners = false;
          };

          # Load up the extensions
          "org/gnome/shell".enabled-extensions =
            map (ext: ext.extensionUuid) extensions;

          # Blur My Shell
          "org/gnome/shell/extensions/blur-my-shell".static-blur = true;

          # Static Workspaces, and its keybindings
          "org/gnome/mutter".dynamic-workspaces = false;
          "org/gnome/desktop/wm/preferences".num-workspaces = mkInt32 5;
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

          "org/gnome/desktop/interface".cursor-theme = "Bibata-Modern-Ice";
          "org/gnome/desktop/interface".gtk-enable-primary-paste = false;
          "org/gnome/desktop/interface".show-battery-percentage = true;
          "org/gnome/desktop/interface".locate-pointer = false;
          "org/gnome/desktop/interface".show-seconds = true;
          "org/gnome/desktop/interface".show-date = true;
          "org/gnome/desktop/interface".show-weekday = true;
          "org/gnome/desktop/peripherals/touchpad".natural-scroll = false;
          "org/gnome/desktop/wm/keybindings".close = [ "<Super>q" ];
          "org/gnome/desktop/wm/preferences".button-layout =
            "appmenu:minimize,maximize,close";

          "org/gnome/mutter".center-new-windows = false;
          "org/gnome/mutter".experimental-features =
            [ "scale-monitor-framebuffer" "variable-refresh-rate" ];

          "org/gnome/settings-daemon/plugins/media-keys".volume-step =
            mkInt32 5;
          "org/gnome/settings-daemon/plugins/power".power-button-action =
            "interactive";

          # Custom keybinds, registrations
          "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
          ];

          # VSCode, on Super+C
          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" =
            {
              binding = "<Super>C";
              command = "code";
              name = "Launch VSCode";
            };

          # Chrome, on Super+W
          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" =
            {
              binding = "<Super>W";
              command = "google-chrome-stable";
              name = "Launch Chrome";
            };

          # Gnome Terminal, on Super+Enter
          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" =
            {
              binding = "<Super>Return";
              command = "kgx";
              name = "Launch Gnome Terminal";
            };

          # Nautilus, on Super+E
          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" =
            {
              binding = "<Super>E";
              command = "nautilus";
              name = "Launch Nautilus";
            };

          # Mission Center, on Ctrl+Shift+Escape
          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" =
            {
              binding = "<Control><Shift>Escape";
              command = "${lib.getExe pkgs.mission-center}";
              name = "Launch Mission Center";
            };
        };
      }];
    };
}
