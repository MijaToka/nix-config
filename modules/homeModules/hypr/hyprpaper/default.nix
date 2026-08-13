{
  flake.homeModules.hyprpaper =
    {
      config,
      ...
    }:
    {
      services.hyprpaper = {
        enable = true;
        settings = {
          splash = false;
          preload = [ config.stylix.image ];
          wallpaper = {
            monitor = "";
            path = config.stylix.image;
          };
        };
      };
    };
}
