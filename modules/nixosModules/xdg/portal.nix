{ moduleWithSystem, ... }: {
  flake.nixosModules.xdg-portals = moduleWithSystem (
    { inputs', ... }:
    { pkgs, ... }:
    {
      xdg.portal = {
        enable = true;

        config = {
          hyprland.preferred = [
            "gtk"
            "hyprland"
          ];
          umbriel = {
            "org.freedesktop.impl.portal.FileChooser" = "luciole";
          };
        };
        extraPortals = with pkgs; [
          inputs'.luciole.packages.default
          xdg-desktop-portal-gtk
          xdg-desktop-portal-hyprland
        ];
      };
    }
  );
}
