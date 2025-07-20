{
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {

      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";

      monitor = ",preferred,auto,auto";

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screenshots"
        "XCURSOR_SIZE,24"
      ];

      # debug = {
      #   disable_logs = false;
      #   enable_std_out_logs = true;
      # };
    
      xwayland.force_zero_scaling = true;

      input = {
        kb_layout = "latam";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.8;
        };

        sensitivity = -0.15; # [-1.0,1.0], 0 means no modification.
      };

      general = {
        gaps_in = 2;
        gaps_out = 5;

        border_size = 2;

        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
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
    
      animations = {
        enabled = true;
        workspace_wraparound = true;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master.new_status = "master";

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = true;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = false;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };

      windowrule = [
        # "supressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        # "force_xwayland, class:^(steam)$"
        # "force_xwayland, title:^(Steam.*)$"
      ];

      exec-once = [
        "waybar"
        "hyprpaper"
      ];

    };
  };
}