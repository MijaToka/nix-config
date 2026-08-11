{
  flake.homeModules.hyprland = {
    wayland.windowManager.hyprland.settings = {
      window_rule = [
        {
          name = "Floating discord popup";
          match = {
            class = "discord";
            initial_title = "(Discord Popout)";
          };
          float = true;
          size = [
            "(monitor_w*0.75)"
            "(monitor_h*0.75)"
          ];
        }
        {
          name = "Floating networkmanager tui";
          match = {
            class = "kitty";
            title = "FloatingKitty";
          };
          float = true;
          move = [
            "(monitor_w*0.5)"
            (toString 48)
          ];
          size = [
            "(monitor_w*0.5)"
            "(monitor_h*0.5)"
          ];
        }
        {
          name = "Floating Blueman";
          match = {
            class = "^.blueman-manager-wrapped$";
          };
          float = true;
          move = [
            "(monitor_w*0.68)"
            (toString 48)
          ];
          size = [
            "(monitor_w*0.25)"
            "(monitor_h*0.5)"
          ];
        }
        {
          name = "No focus floating XWayland";
          match = {
            title = "^$";
            xwayland = true;
            float = true;
            fullscreen = false;
            pin = false;
          };
          no_focus = true;
        }

      ];
    };
  };
}
