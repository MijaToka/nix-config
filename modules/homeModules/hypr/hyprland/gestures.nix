{
  flake.homeModules.hyprland = {
    wayland.windowManager.hyprland.settings = {
      gesture =
        let
          mkGesture = fingers: direction: action: {
            inherit fingers direction action;
          };
        in
        [
          (mkGesture 3 "horizontal" "workspace")
          (mkGesture 4 "pinch" "fullscreen")
          ((mkGesture 3 "swipe" "resize") // { mods = "SUPER"; })
        ];
    };
  };
}
