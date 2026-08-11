{
  flake.homeModules.hyprland = { lib, ... }: {

    wayland.windowManager.hyprland.settings = {
      config = {
        animations = {
          enabled = true;
          workspace_wraparound = true;
        };
      };

      curve =
        let
          mkBezier = name: points: {
            _args = [
              name
              {
                type = "bezier";
                inherit points;
              }
            ];
          };
        in
        [
          /*nixfmt:disable*/
          (mkBezier "easeOutQuint" [ [ 0.23 1 ] [ 0.32 1 ] ])
          (mkBezier "easeInOutCubic" [ [ 0.65 0.05 ] [ 0.36 1 ] ])
          (mkBezier "linear" [ [ 0 0 ] [ 1 1 ] ])
          (mkBezier "almostLinear" [ [ 0.5 0.5 ] [ 0.75 1.0 ] ])
          (mkBezier "quick" [ [ 0.15 0 ] [ 0.1 1 ] ])
          /*nixfmt:enable*/
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
            let
              speedVal = toString speed;
            in
            {
              inherit leaf enabled;
              speed = speedVal;
              bezier = curve;
              style = lib.mkIf (styleStr != "") styleStr;
            };
        in
        [
          (mkAnimation {
            leaf = "global";
            enabled = true;
            speed = 10;
            curve = "default";
            styleStr = "";
          })
          (mkAnimation {
            leaf = "border";
            enabled = true;
            speed = 5.39;
            curve = "easeOutQuint";
            styleStr = "";
          })
          (mkAnimation {
            leaf = "windows";
            enabled = true;
            speed = 4.79;
            curve = "easeOutQuint";
            styleStr = "";
          })
          (mkAnimation {
            leaf = "windowsIn";
            enabled = true;
            speed = 4.1;
            curve = "easeOutQuint";
            styleStr = "popin 87%";
          })
          (mkAnimation {
            leaf = "windowsOut";
            enabled = true;
            speed = 1.49;
            curve = "linear";
            styleStr = "popin 87%";
          })
          (mkAnimation {
            leaf = "fadeIn";
            enabled = true;
            speed = 1.73;
            curve = "almostLinear";
            styleStr = "";
          })
          (mkAnimation {
            leaf = "fadeOut";
            enabled = true;
            speed = 1.46;
            curve = "almostLinear";
            styleStr = "";
          })
          (mkAnimation {
            leaf = "fade";
            enabled = true;
            speed = 3.03;
            curve = "quick";
            styleStr = "";
          })
          (mkAnimation {
            leaf = "layers";
            enabled = true;
            speed = 3.81;
            curve = "easeOutQuint";
            styleStr = "";
          })
          (mkAnimation {
            leaf = "layersIn";
            enabled = true;
            speed = 4;
            curve = "easeOutQuint";
            styleStr = "fade";
          })
          (mkAnimation {
            leaf = "layersOut";
            enabled = true;
            speed = 1.5;
            curve = "linear";
            styleStr = "fade";
          })
          (mkAnimation {
            leaf = "fadeLayersIn";
            enabled = true;
            speed = 1.79;
            curve = "almostLinear";
            styleStr = "";
          })
          (mkAnimation {
            leaf = "fadeLayersOut";
            enabled = true;
            speed = 1.39;
            curve = "almostLinear";
            styleStr = "";
          })
          (mkAnimation {
            leaf = "workspaces";
            enabled = true;
            speed = 1.94;
            curve = "almostLinear";
            styleStr = "fade";
          })
          (mkAnimation {
            leaf = "workspacesIn";
            enabled = true;
            speed = 1.21;
            curve = "almostLinear";
            styleStr = "fade";
          })
          (mkAnimation {
            leaf = "workspacesOut";
            enabled = true;
            speed = 1.94;
            curve = "almostLinear";
            styleStr = "fade";
          })
        ];
    };
  };
}
