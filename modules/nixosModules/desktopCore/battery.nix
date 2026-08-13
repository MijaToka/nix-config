{
  flake.nixosModules.batteryManagement =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.batteryManagement;
    in
    {
      options = {
        batteryManagement.enable = lib.mkEnableOption "battery/power management configuration";
      };
      config = lib.mkIf cfg.enable {
        powerManagement.enable = true;

        services = {
          thermald.enable = true;

          power-profiles-daemon.enable = false;

          auto-cpufreq = {
            enable = true;
            settings = {
              charger = {
                guvenor = "performance";
                turbo = "auto";
              };
              battery = {
                guvenor = "powersave";
                turbo = "auto";
              };
            };
          };
        };
        environment.systemPackages = with pkgs; [ auto-cpufreq ];
      };
    };
}
