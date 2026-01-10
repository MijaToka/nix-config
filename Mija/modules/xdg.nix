{ pkgs, ... }:
{
  xdg = {
    mimeApps = {
      enable = false;
      defaultApplications = {
        "image/*" = "qimgv.desktop";
        "video/*" = "mpv.desktop";
      };
    };
    desktopEntries = {
      qimgv = {
        name = "QImgV";
        exec = "${pkgs.qimgv}/bin/qimgv";
        icon = "qimgv";
      };
      mpv = {
        name = "mpv Media Player";
        exec = "${pkgs.mpv}/bin/mpv";
      };
    };
  };
}
