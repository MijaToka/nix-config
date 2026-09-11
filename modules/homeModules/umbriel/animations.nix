{
  flake.homeModules.umbriel = {
    programs.umbriel.settings.animation = {
      enabled = true;
      duration_ms = 250;
      curve = "easeout";

      beziers = {
        /*nixfmt:disable*/
        easeOutQuint = [ 0.23 1 0.32 1 ];
        easeInOutCubic = [ 0.65 0.05 0.36 1 ];
        linear = [ 0 0 1 1 ];
        almostLinear = [ 0.5 0.5 0.75 1 ];
        quick = [ 0.15 0 0.1 1 ];
        /*nixfmt:enable*/
      };

      windows_in = {
        enabled = true;
        duration_ms = 150;
        curve = "easeoutQuint";
        style = "popin";
        scale = 0.87;
      };

      windows_out = {
        enabled = true;
        duration_ms = 150;
        curve = "linear";
        style = "slide";
      };

      windows_move = {
        enabled = true;
        duration_ms = 150;
        curve = "quick";
      };

      workspaces = {
        enabled = true;
        duration_ms = 100;
        curve = "almostLinear";
      };

      overview = {
        enabled = true;
        duration_ms = 250;
        curve = "easeInOutCubic";
      };

      scratchpad = {
        enabled = true;
        duration_ms = 150;
        curve = "almostLinear";
        dim = 0.5;
        blur = false;
        maximize = true;
        fullscreen = false;
      };

      border = {
        enabled = true;
        duration_ms = 150;
        curve = "easeoutQuint";
      };

      dim_unfocused = {
        enabled = true;
        duration_ms = 250;
        curve = "easeoutQuint";
      };

    };
  };
}
