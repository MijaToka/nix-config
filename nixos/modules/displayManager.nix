{ pkgs, ... }:
{

  # Enable automatic login for the user.
  services.displayManager = {

    sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs.kdePackages; [
        qtsvg
        qtmultimedia
        qtvirtualkeyboard
      ];
      theme = "sddm-astronaut-theme";

    };

    autoLogin = {
      enable = false;
      user = "mija";
    };

  };

  #Install theme
  environment.systemPackages = with pkgs; [
    (sddm-astronaut.override {
      embeddedTheme = "black_hole";
    })
  ];
}
