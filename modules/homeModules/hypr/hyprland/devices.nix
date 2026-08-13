{
  flake.homeModules.hyprland = {
    wayland.windowManager.hyprland.settings = {
      config.input = {
        kb_layout = "latam";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.5;
        };

        sensitivity = -0.45; # [-1.0,1.0], 0 means no modification.
      };
      device =
        let
          englishKeyboards =
            map
              (kb: {
                name = kb;
                kb_layout = "us";
                kb_variant = "altgr-intl";
              })
              [
                "keychron-k2-he-keyboard"
                "keychron-keychron-k2-he-keyboard"
                "zsa-technology-labs-voyager"
                "zsa-technology-labs-voyager-system-control"
                "zsa-technology-labs-voyager-consumer-control"
                "zsa-technology-labs-voyager-keyboard"
              ];
        in
        [
          {
            name = "asue140d:00-04f3:31b9-touchpad";
            sensitivity = 0.25;
          }
          {
            name = "wacom-intuos-bt-m-pen";
            output = "current";
          }
        ]
        ++ englishKeyboards;
    };
  };
}
