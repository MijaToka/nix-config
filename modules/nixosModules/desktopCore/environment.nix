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
        };

      };
    };
}
