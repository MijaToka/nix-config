{pkgs, ...}: {
  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix;
    };
  };
  security.pam.services = {
    hyprlock.fprintAuth = true;
    sddm.fprintAuth = true;
  };
}
