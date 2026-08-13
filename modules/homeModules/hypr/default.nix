{ self, ... }: {
  flake.homeModules.hyprBundle = {
    imports = with self.homeModules; [
      hyprland
      hyprlock
      hypridle
      hyprpaper
      hyprshot
    ];
  };
}
