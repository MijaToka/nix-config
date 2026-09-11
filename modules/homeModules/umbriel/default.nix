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
            scrolling = { };
          };
        };

      };
    }
  );
}
