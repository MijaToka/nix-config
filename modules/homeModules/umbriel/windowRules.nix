{
  flake.homeModules.umbriel = {
    programs.umbriel.settings = {
      window_rule = [
        {
          blur = true;
        }
        {
          # Maximize windows that are alone
          match.is_alone = true;
          default_maximize = true;
        }
        {
          # Steam notification toast
          match.title = "^notificationtoast_.+desktop";
          default_position = {
            x = 0;
            y = 0;
          };
          default_focused = false;
          default_pinned = true;
        }
        {
          # XWayland popups fix (steam popup)
          match = {
            title = "^$";
            # xwayland = true;
            is_floating = true;
            # fullscreen = false;
            is_pinned = true;
          };
          default_focused = false;
        }
      ];
    };
  };
}
