{ inputs, moduleWithSystem, ... }: {
  flake.homeModules.umbriel = moduleWithSystem (
    { inputs', ... }: { lib, ... }: {
      imports = [ inputs.umbriel.homeModules.default ];

      programs.umbriel = {
        enable = true;
        settings = {
          general = {
            autostart = [ "${lib.getExe inputs'.noctalia.packages.default}" ];
            mod_key = "Super";
            xwayland = true;
            show_cheatsheet = false;
          };
          layout = {
            mode = "scrolling";
            extent_presets = [
              0.33
              0.5
              0.66
              1
            ];
            scrolling = {
              default_extent_fraction = 0.5;
            };
          };
        };

      };
    }
  );
}
