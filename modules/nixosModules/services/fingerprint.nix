{
  flake.nixosModules.fprintAuthentication =
    { pkgs, ... }:
    {
      services.fprintd = {
        enable = true;
        tod = {
          enable = true;
          driver = pkgs.libfprint-2-tod1-goodix;
        };
      };
      systemd.services.fprintd.environment.G_MESAGES_DEBUG = "all";

      security.pam.services = {
        hyprlock.fprintAuth = true;
        sddm.fprintAuth = true;
      };
    };
}
