{ pkgs, ... }:
{
  xdg.desktopEntries = {
    qimgv = {
      name = "QImgV";
      exec = "${pkgs.qimgv}/bin/qimgv";
      icon = "qimgv";
    };
    mpv = {
      name = "mpv Media Player";
      exec = "${pkgs.mpv}/bin/mpv";
      icon = "mpv";
    };
  };
}
