{
  flake.homeModules.mpv = {
    programs.mpv = {
      enable = true;
      config = {
        target-colorspace-hint-mode = "source";
      };
    };
  };
}
