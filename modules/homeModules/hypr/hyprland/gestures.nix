{
  flake.homeModules.hyprland = {
    wayland.windowManager.hyprland.settings = {
      gesture =
        let
          mkGesture =
            fingers: direction: action:
            let
              fingersStr = toString fingers;
              directionStr = ''"${direction}"'';
              actionStr = ''"${action}"'';
            in
            {
              fingers = fingersStr;
              direction = directionStr;
              action = actionStr;
            };
        in
        [
          (mkGesture 3 ''"horizontal"'' ''"workspace"'')
          (mkGesture 4 ''"pinch"'' ''"fullscreen"'')
          ((mkGesture 3 ''"swipe"'' ''"resize"'') // { mods = ''"SUPER"''; })
        ];
    };
  };
}
