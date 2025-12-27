{ pkgs, ... }:
{
  powerManagement.enable = true;
  services.thermald.enable = true;

  environment.systemPackages = with pkgs; [ auto-cpufreq ];

  services.power-profiles-daemon.enable = false;

  services.auto-cpufreq = {
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
}
