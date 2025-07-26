{ config, ... }:let
  base16Scheme = config.stylix.base16Scheme;
in {
  programs.quickshell = {
    enable = true;
    config = {
      inherit base16Scheme;
    };
  };
}