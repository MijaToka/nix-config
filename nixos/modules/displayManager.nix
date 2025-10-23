{ pkgs, ... }:
{
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs.kdePackages; [
        qtsvg
        qtmultimedia
      ];
      theme = "sddm-astronaut-theme";

    };
  };
  environment.systemPackages = with pkgs; [
    sddm-astronaut
  ];
}
