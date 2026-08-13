{
  flake.homeModules.xdgConfig = {
    xdg.mimeApps = {
      enable = false;
      defaultApplications = {
        "image/*" = "qimgv.desktop";
        "video/*" = "mpv.desktop";
      };
    };
  };
}
