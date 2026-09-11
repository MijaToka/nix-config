{
  flake.homeModules.umbriel = {
    programs.umbriel.settings.input = {
      middle_click_paste = true;
      window_drag_toggle = "none";
      focus.follows_mouse = true;

      keyboard = {
        layout = "latam";
        variant = "";
        options = "grp:alt_shift_toggle";
      };

      touchpad = {
        tap = true;
        natural_scroll = true;
        sensitivity = 0.25;
        scroll_factor = 1.5;
      };

      mouse = {
        natural_scroll = false;
        sensitivity = -0.45;
      };

      tablet = {
        enabled = true;
        map_to_focused_window = true;
      };

      device =
        let
          englishKeyboards =
            map
              (name: {
                inherit name;
                layout = "us";
                variant = "altgr-intl";
              })
              [
                "ZSA Technology Labs Voyager"
                "ZSA Technology Labs Voyager System Control"
                "ZSA Technology Labs Voyager Consumer Control"
                "ZSA Technology Labs Voyager Keyboard"
              ];
        in
        englishKeyboards;
    };
  };
}
