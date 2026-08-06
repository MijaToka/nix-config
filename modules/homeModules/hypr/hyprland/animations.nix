{
  flake.homeModule.hyprland = { lib, ... }: {

    wayland.windowManager.hyprland.settings = {
      config = {
        animations = {
          enabled = true;
          workspace_wraparound = true;
        };
      };

      curve =
        let
          mkBezier =
            name:
            {
              x1,
              y1,
              x2,
              y2,
            }:
            {
              _args = [
                name
                {
                  type = "bezier";
                  points = lib.generators.mkLuaInline "{ {${x1},${y1}}, {${x2},${y2}} }";
                }
              ];
            };
        in
        [
          (mkBezier "easeOutQuint" {
            x1 = 0.23;
            y1 = 1;
            x2 = 0.32;
            y2 = 1;
          })
          (mkBezier "easeInOutCubic" {
            x1 = 0.65;
            y1 = 0.05;
            x2 = 0.36;
            y2 = 1;
          })
          (mkBezier "linear" {
            x1 = 0;
            y1 = 0;
            x2 = 1;
            y2 = 1;
          })
          (mkBezier "almostLinear" {
            x1 = 0.5;
            y1 = 0.5;
            x2 = 0.75;
            y2 = 1.0;
          })
          (mkBezier "quick" {
            x1 = 0.15;
            y1 = 0;
            x2 = 0.1;
            y2 = 1;
          })
        ];
      animation =
        let
          mkAnimation =
            {
              leaf,
              enabled,
              speed,
              curve,
              styleStr ? "",
            }:
            {
              inherit leaf enabled speed;
              bezier = curve;
              style = lib.mkIf (styleStr != "") styleStr;
            };
        in
        [
          (mkAnimation {
            leafName = "global";
            enabled = true;
            speed = 10;
            curve = "default";
            styleStr = "";
          })
          (mkAnimation {
            leafName = "border";
            enabled = true;
            speed = 5.39;
            curve = "easeOutQuint";
            styleStr = "";
          })
          (mkAnimation {
            leafName = "windows";
            enabled = true;
            speed = 4.79;
            curve = "easeOutQuint";
            styleStr = "";
          })
          (mkAnimation {
            leafName = "windowsIn";
            enabled = true;
            speed = 4.1;
            curve = "easeOutQuint";
            styleStr = "popin 87%";
          })
          (mkAnimation {
            leafName = "windowsOut";
            enabled = true;
            speed = 1.49;
            curve = "linear";
            styleStr = "popin 87%";
          })
          (mkAnimation {
            leafName = "fadeIn";
            enabled = true;
            speed = 1.73;
            curve = "almostLinear";
            styleStr = "";
          })
          (mkAnimation {
            leafName = "fadeOut";
            enabled = true;
            speed = 1.46;
            curve = "almostLinear";
            styleStr = "";
          })
          (mkAnimation {
            leafName = "fade";
            enabled = true;
            speed = 3.03;
            curve = "quick";
            styleStr = "";
          })
          (mkAnimation {
            leafName = "layers";
            enabled = true;
            speed = 3.81;
            curve = "easeOutQuint";
            styleStr = "";
          })
          (mkAnimation {
            leafName = "layersIn";
            enabled = true;
            speed = 4;
            curve = "easeOutQuint";
            styleStr = "fade";
          })
          (mkAnimation {
            leafName = "layersOut";
            enabled = true;
            speed = 1.5;
            curve = "linear";
            styleStr = "fade";
          })
          (mkAnimation {
            leafName = "fadeLayersIn";
            enabled = true;
            speed = 1.79;
            curve = "almostLinear";
            styleStr = "";
          })
          (mkAnimation {
            leafName = "fadeLayersOut";
            enabled = true;
            speed = 1.39;
            curve = "almostLinear";
            styleStr = "";
          })
          (mkAnimation {
            leafName = "workspaces";
            enabled = true;
            speed = 1.94;
            curve = "almostLinear";
            styleStr = "fade";
          })
          (mkAnimation {
            leafName = "workspacesIn";
            enabled = true;
            speed = 1.21;
            curve = "almostLinear";
            styleStr = "fade";
          })
          (mkAnimation {
            leafName = "workspacesOut";
            enabled = true;
            speed = 1.94;
            curve = "almostLinear";
            styleStr = "fade";
          })
        ];
    };
  };
}
