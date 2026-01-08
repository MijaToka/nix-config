{ pkgs, ... }:
{
  xdg = {
    mimeApps = {
      defaultApplications = {
        "image/*" = "qimgv.desktop";
        "video/*" = "mpv.desktop";
      };
    };
    desktopEntries = {
      qimv = {
        name = "QImgV";
        exec = "${pkgs.qimgv}/bin/qimgv";
      };
      mpv = {
        name = "mpv Media Player";
        exec = "${pkgs.mpv}/bin/mpv";
      };
    };
  };
}
