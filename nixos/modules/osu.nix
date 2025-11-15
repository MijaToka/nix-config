{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    osu-lazer
    (pkgs.writeShellScriptBin "osu-lazer-otd" ''
      systemctl start unbind-wacom.service
      systemctl start openTabletDriver.service
      ${pkgs.osu.lazer}/bin/osu-lazer
      systemctl stop openTabletDriver.service
      systemctl start rebind-wacom.service
    '')
  ];
}
