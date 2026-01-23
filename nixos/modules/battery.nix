{ pkgs, ... }:
{
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
}
