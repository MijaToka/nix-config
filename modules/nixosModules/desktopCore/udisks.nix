{
  flake.nixosModules.udisks = { lib, pkgs, ... }: {
    services = {
      udisks2.enable = true;
      dbus = {
        enable = true;
        implementation = "broker";
      };
    };

    systemd.user.services.udiskie = {
      unitConfig = {
        Description = "udiskie mount daemon";
        Requires = "tray.target";
        After = [
          "graphical-session.target"
          "tray.target"
        ];
        PartOf = [ "graphical-session.target" ];
      };

      serviceConfig.ExecStart = toString [ (lib.getExe' pkgs.udiskie "udiskie") ];

      wantedBy = [ "graphical-session.target" ];
    };

    environment.systemPackages = [ pkgs.udiskie ];
  };
}
