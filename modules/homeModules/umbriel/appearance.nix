{
  flake.homeModules.umbriel = {
    programs.umbriel.settings.appearance = {
      prefer_no_csd = true;
      border_width = 2;
      outer_border_width = 0;
      corner_radius = 10;
      drag_opacity = 0.75;

      blur = {
        enabled = true;
        optimized = true;
        passes = 2;
        radius = 10;
        noise = 0.01;
        brightness = 0.95;
        contrast = 0.85;
        saturation = 1.1;
      };

      shadow = {
        enabled = false;
        softness = 100;
        offset_x = 2;
        offset_y = 2;
      };
    };
  };
}
