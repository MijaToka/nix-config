{
  flake.homeModules.hyprland = {
    wayland.windowManager.hyprland = {
      settings.monitor = {
        output = "";
        mode = "preferred";
        position = "auto";
        scale = 1;
      };
      extraConfig = ''
        require("monitors")
        require("workspaces")
      '';

    };
  };
}
