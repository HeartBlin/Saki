{
  flake.nixosModules.hyprland = { currentUser, inputs', pkgs, ... }: {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      package = inputs'.hyprland.packages.hyprland;
      portalPackage = inputs'.hyprland.packages.xdg-desktop-portal-hyprland;
    };

    hjem.users."${currentUser}".files.".config/hypr/hyprland.conf".text =
      let uwsm = "uwsm app -- ";
      in ''
        ## Environment variables ##
        # Cursor sizes
        env = XCURSOR_SIZE,24
        env = HYPRCURSOR_SIZE,24

        # Force apps to use Wayland
        env = GDK_BACKEND,wayland,x11,*
        env = QT_QPA_PLATFORM,wayland;xcb
        env = SDL_VIDEODRIVER,wayland
        env = ELECTRON_OZONE_PLATFORM_HINT,wayland
        env = OZONE_PLATFORM,wayland
        env = XDG_SESSION_TYPE,wayland

        # Bette screen sharing
        env = XDG_CURRENT_DESKTOP,Hyprland
        env = XDG_SESSION_DESKTOP,Hyprland

        ## Monitors ##
        monitor = eDP-1, 1920x1080@144, 0x0, 1

        # Fix xwayland
        xwayland {
          force_zero_scaling = true
        }

        ## Startup ##
        # Apps
        exec-once = caelestia-shell
        exec-once = foot --server
        exec-once = vicinae server
        exec-once = hyprpaper
        exec-once = swayosd-server

        # Fixes
        exec-once = systemctl --user import-environment $(env | cut -d'=' -f 1)
        exec-once = dbus-update-activation-environment --systemd --all
        exec-once = hyprctl setcursor Bibata-Modern-Ice 24

        ## Appearance ##
        general {
          border_size = 2
          gaps_in = 10
          gaps_out = 20
          col.inactive_border = 0xff444444
          col.active_border = 0xffef7e7e 0xffe57474 0xfff4d67a 0xffe5c76b 0xff96d988 0xff8ccf7e 0xff67cbe7 0xff6cbfbf 0xff71baf2 0xffc47fd5 45deg

          resize_on_border = true
        }

        decoration {
          rounding  = 10

          blur {
            enabled = false
          }
        }

        ## Binds ##
        # Applications
        bind = Super, Return, exec, ${uwsm} footclient
        bind = Super, Space, exec, ${uwsm} vicinae toggle
        bind = Super, E, exec, ${uwsm} nautilus
        bind = Super, W, exec, ${uwsm} google-chrome-stable

        # Close windows/Hyprland
        bind = Super, Q, killactive
        bind = Super Shift, Q, exit

        # Switch workspaces
        bind = Super, 1, workspace, 1
        bind = Super, 2, workspace, 2
        bind = Super, 3, workspace, 3
        bind = Super, 4, workspace, 4
        bind = Super, 5, workspace, 5
        bind = Super, 6, workspace, 6
        bind = Super, 7, workspace, 7
        bind = Super, 8, workspace, 8
        bind = Super, 9, workspace, 9
        bind = Super, 0, workspace, 10

        # Move active window to workspace
        bind = Super Shift, 1, movetoworkspace, 1
        bind = Super Shift, 2, movetoworkspace, 2
        bind = Super Shift, 3, movetoworkspace, 3
        bind = Super Shift, 4, movetoworkspace, 4
        bind = Super Shift, 5, movetoworkspace, 5
        bind = Super Shift, 6, movetoworkspace, 6
        bind = Super Shift, 7, movetoworkspace, 7
        bind = Super Shift, 8, movetoworkspace, 8
        bind = Super Shift, 9, movetoworkspace, 9
        bind = Super Shift, 0, movetoworkspace, 10

        # Mouse binds
        bindm = Super, mouse:272, movewindow
        bindm = Super, mouse:273, resizewindow

        # Media keys
        bindel = ,XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise
        bindel = ,XF86AudioLowerVolume, exec, swayosd-client --output-volume lower
        bindel = ,XF86AudioMute, exec, swayosd-client --output-volume mute-toggle
        bindel = ,XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle
        bindel = ,XF86MonBrightnessUp, exec, swayosd-client --brightness raise
        bindel = ,XF86MonBrightnessDown, exec, swayosd-client --brightness lower
        bindel = ,XF86AudioPlay, exec, swayosd-client --playerctl play-pause

        ## Window Rules ##
        # Steam
        windowrule = float, class:steam
        windowrule = center, class:steam, title:Steam
        windowrule = opacity 1 1, class:steam
        windowrule = size 1100 700, class:steam, title:Steam
        windowrule = size 460 800, class:steam, title:Friends List
        windowrule = idleinhibit fullscreen, class:steam

        # Input
        input {
          kb_layout = ro
          follow_mouse = 1
          sensitivity = 0
          touchpad {
            natural_scroll = false
            clickfinger_behavior = true
            disable_while_typing = true
            tap-to-click = true
          }
        }

        ## Extras ##
        # Shut up
        ecosystem {
          no_update_news = true
          no_donation_nag = true
        }
      '';

    users.users."${currentUser}".packages = with pkgs; [ swayosd swww ];
  };
}
