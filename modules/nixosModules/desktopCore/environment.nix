{
  flake.nixosModules.environmentConfig =
    { pkgs, ... }:
    {
      environment = {
        shells = [ pkgs.zsh ];
        variables = {
          EDITOR = "vim";
          SYSTEMD_EDITOR = "vim";
          VISUAL = "vim";
        };
        sessionVariables = {
          WLR_NO_HARDWARE_CURSORS = "1";
          NIXOS_OZONE_WL = "1";

          # Make apps use the portal
          GTK_USE_PORTAL = "1";
          GDK_DEBUG = "portals";
          QT_QPA_PLATFORMTHEME = "xdgdesktopportal";

        };

      };
    };
}
