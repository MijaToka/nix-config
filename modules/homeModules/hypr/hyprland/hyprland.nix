{
  flake.homeModules.hyprland = { lib, ... }: {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      xwayland.enable = true;
      configType = "lua";

      settings = {
        env =
          let
            mkEnvVar = name: value: {
              _args = [
                name
                value
              ];
            };
          in
          [
            (mkEnvVar "XDG_CURRENT_DESKTOP" "Hyprland")
            (mkEnvVar "XDG_SESSION_DESKTOP" "Hyprland")
            (mkEnvVar "XDG_SCREENSHOTS_DIR" "~/Imágenes/Screenshots/")
            (mkEnvVar "XCURSOR_SIZE" 24)
          ];

        config = {
          general = {
            gaps_in = 2;
            gaps_out = 5;

            border_size = 2;

            "col.active_border" = {
              colors = lib.generators.mkLuaInline ''{"rgba(6791d9ee)", "rgba(f5a3a5ee)"}'';
              angle = "135";
            };
            "col.inactive_border" = "rgba(595959aa)";

            resize_on_border = true;
            extend_border_grab_area = 20;
            # hover_icon_on_border = true; Default true
            # allow_tearing = false;

            layout = "dwindle";
            # no_cursor_warps = false;
          };

          decoration = {
            rounding = 10;
            rounding_power = 2;

            active_opacity = 1.0;
            inactive_opacity = 1.0;

            blur = {
              enabled = true;
              size = 10;
              passes = 2;
              vibrancy = 0.1696;
              new_optimizations = true;
            };

            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              color = "rgba(1a1a1aee)";
            };
            # drop_shadow = true;
            # shadow_range = 4;
            # shadow_render_power = 3;
            # "col.shadow" = "rgba(1a1a1aee)";
          };
          misc = {
            animate_manual_resizes = true;
            animate_mouse_windowdragging = true;
            enable_swallow = true;
            # render_ahead_of_time = false;
            disable_hyprland_logo = true;
          };
          debug = {
            disable_logs = false;
          };
          xwayland = {
            force_zero_scaling = true;
          };
        };
        monitor = {
          output = "";
          mode = "preferred";
          position = "auto";
          scale = 1;
        };
      };
    };
  };
}
