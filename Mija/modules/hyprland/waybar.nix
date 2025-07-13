{
  programs.waybar = {
    enable = true;
    # style = ./style.css
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "9 13 -10 18"; # Read about this more

        modules-left = [];
        modules-center = [];
        modules-right = [];
        
        "hyprland/workspaces".diable-scroll = true;
      };
    };
  };
}