{ pkgs, lib, ... }:
{
  # services.opentabletdriver = {
  #   enable = true;
  #   daemon.enable = false;
  # };
  #
  # systemd.services.opentabletdriver.wantedBy = lib.mkForce [ ];

  services.xserver.wacom.enable = true;

}
