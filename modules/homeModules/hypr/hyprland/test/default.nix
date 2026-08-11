{
  self,
  inputs,
  withSystem,
  ...
}:
{
  flake = {
    homeConfigurations.hyprTest = withSystem "x86_64-linux" (
      { pkgs, ... }:
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = with self.homeModules; [
          hyprland
          {
            home = {
              username = "tmp";
              homeDirectory = "/tmp";
              stateVersion = "26.05";
            };
          }
        ];
      }
    );
  };

  perSystem = { pkgs, ... }: {
    packages.hyprConfigFile = pkgs.writeTextFile {
      name = "hyprlandConfigFile";
      text = self.homeConfigurations.hyprTest.config.xdg.configFile."hypr/hyprland.lua".text;
      destination = "/hyprland.lua";
    };
  };
}
