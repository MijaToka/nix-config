{ pkgs, ... }:
{
  services.displayManager = {
    sddm = {
      enable = true;
      theme = "sddm-astronaut-theme";
    };
  };
  environment.systemPackages = with pkgs; [
    sddm-astronaut-theme
    kdePackages.qtmultimedia
  ];
}
