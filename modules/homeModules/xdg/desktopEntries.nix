{
  flake.homeModules.xdgConfig =
    { lib, pkgs, ... }:
    {
      xdg.desktopEntries = {
        qimgv = {
          name = "QImgV";
          exec = "${lib.getExe pkgs.qimgv}";
          icon = "qimgv";
        };
        mpv = {
          name = "mpv Media Player";
          exec = "${lib.getExe pkgs.mpv}";
          icon = "mpv";
        };
      };
    };
}
